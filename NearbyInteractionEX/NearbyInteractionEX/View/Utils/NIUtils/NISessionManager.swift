//
//  NISessionManager.swift
//  NearbyInteractionEX
//
//  Created by Bokyung on 2023/05/03.
//

import Foundation
import NearbyInteraction
import MultipeerConnectivity
import UIKit

// 데이터를 저장하고 검색하기 위해 인코딩, 디코딩할 수 있음.
class TranData: NSObject, NSCoding {
    let token : NIDiscoveryToken // 디바이스 검색 토큰
    let isBumped : Bool // 충돌 여부
    let nickname : String // 디바이스 소유자의 닉네임
    let isOK : Bool // 디바이스 소유자의 운동완료 여부
    
    init(token : NIDiscoveryToken, isBumped : Bool = false, nickname : String = "", isOK: Bool) {
        self.token = token
        self.isBumped = isBumped
        self.nickname = nickname
        self.isOK = isOK
    }
    
    // 인코딩
    func encode(with coder: NSCoder) {
        coder.encode(self.token, forKey: "token")
        coder.encode(self.isBumped, forKey: "isMatched")
        coder.encode(self.nickname, forKey: "nickname")
        coder.encode(self.isOK, forKey: "isoK")
    }
    
    // 디코딩
    required init?(coder: NSCoder) {
        self.token = coder.decodeObject(forKey: "token") as! NIDiscoveryToken
        self.isBumped = coder.decodeBool(forKey: "isMatched")
        self.nickname = coder.decodeObject(forKey: "nickname") as! String
        self.isOK = coder.decodeObject(forKey: "isoK") as? Bool ?? false
    }
} // : class TranData - 데이터를 저장하고 검색하기 위한 인코딩, 디코딩


class NISessionManager: NSObject, ObservableObject {
    
    @Published var connectedPeers = [MCPeerID]()
    @Published var matchedObject: TranData? // 매치된 오브젝트
    @Published var peersCnt: Int = 0 // 내 주변의 찾은 peer수
    @Published var gameState : UserState = .ready // peer를 찾았는지 못찾았는지에 대한 상태
    @Published var isBumped: Bool = false // 상대방과 가까이 붙었는지 여부
    @Published var isPermissionDenied = false // 이건 뭐지?
    
    var mpc: MPCSession?
    var sessions = [MCPeerID:NISession]()
    var peerTokensMapping = [NIDiscoveryToken:MCPeerID]()
    
    let nearbyDistanceThreshold: Float = 0.08 // 범프 한계 거리
    
    // 나의 정보
    @Published var myNickname : String = "Bokyung"
    @Published var myIsOK : Bool = false
    
    // 나와 통신할(범프된) peer
    @Published var bumpedName = "" // peer 이름
    @Published var bumpedisOK = false // peer의 운동을 완료했는지 여부 - true, false
    
    override init() {
        super.init()
    }

    // 객체가 메모리에서 해제되기 전에 호출되는 메서드 - 객체가 사용한 리소스를 정리하고 해제해야 할 때 사용
    deinit {
        sessions.removeAll() // 배열에 저장된 세션 객체들을 해제
        mpc?.invalidate() // mpc 객체를 무효화하여 연결된 피어와의 연결을 끊고 관련 리소스를 해제
    }
    
    func start() {
        startup()
        
        // 내 닉네임을 coredata에 저장함
        myNickname = CoreDataManager.coreDM.readAllUser()[0].userName ?? ""
    }
    
    func stop() {
        for (_, session) in sessions {
            session.invalidate()
        }
        connectedPeers.removeAll()
        sessions.removeAll()
        peerTokensMapping.removeAll()
        matchedObject = nil
        peersCnt = 0
        //hapticManager.endHaptic()
        if(!isBumped) {
            mpc?.invalidate()
            mpc = nil
        }
    }

    func startup() {
        // mpc 재실행
        mpc?.invalidate()
        mpc = nil
        connectedPeers.removeAll()

        // 1. MPC 작동
        startupMPC()
    }

    // MARK: - MPC를 사용하여 디스커버리 토큰 공유

    func startupMPC() {
        if mpc == nil {
            // Prevent Simulator from finding devices. 좀 더 
            #if targetEnvironment(simulator)
            mpc = MPCSession(service: "burning", identity: "com.2pm.burningbuddy")
            #else
            mpc = MPCSession(service: "burning", identity: "com.2pm.burningbuddy")
            #endif
            mpc?.delegate = self
            mpc?.peerConnectedHandler = connectedToPeer
            mpc?.peerDataHandler = dataReceivedHandler
            mpc?.peerDisconnectedHandler = disconnectedFromPeer
        }
        mpc?.invalidate()
        mpc?.start()
    }
    
    // MPC peerConnectedHandeler에 의해 피어 연결
    // 2. 피어 연결 (NI 디스커버리 토큰을 공유)
    func connectedToPeer(peer: MCPeerID) {
        guard sessions[peer] == nil else { return }
        
        // 해당 피어의 NI Session 생성
        sessions[peer] = NISession()
        sessions[peer]?.delegate = self
        
        guard let myToken = sessions[peer]?.discoveryToken else {
            //            fatalError("Unexpectedly failed to initialize nearby interaction session.")
            return
        }
        
        // 3. 연결된 피어 추가
        if !connectedPeers.contains(peer) {
            // 4. 나의 NI 디스커버리 토큰 공유
            DispatchQueue.global(qos: .userInitiated).async {
                self.shareMyDiscoveryToken(token: myToken, peer: peer)
            }
            connectedPeers.append(peer)
        }
    }

    // MPC peerDisconnectedHander에 의해 피어 연결 해제
    func disconnectedFromPeer(peer: MCPeerID) {
        // 연결 해제시 연결된 피어 제거
        if connectedPeers.contains(peer) {
            connectedPeers = connectedPeers.filter { $0 != peer }
            sessions[peer]?.invalidate()
            sessions[peer] = nil
        }
        
        // 매칭된 상대가 해제 될 경우 제거
        guard let matchedToken = matchedObject?.token else { return }
        if peerTokensMapping[matchedToken] == peer {
            matchedObject = nil
            //hapticManager.endHaptic()
            if !isBumped {
                gameState = .finding
            }
        }
    }
    
    // MPC peerDataHandler에 의해 데이터 리시빙
    // 5. 상대 데이터 수신
    func dataReceivedHandler(data: Data, peer: MCPeerID) {
        guard let receivedData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? TranData else {
            //            fatalError("Unexpectedly failed to decode discovery token.")
            return
        }
        
        //  peer와 디바이스를 가까이 맞댈 경우
        if receivedData.isBumped {
            if !self.isBumped {
                self.isBumped = true
                bumpedName = receivedData.nickname // peer의 이름을 bumpedName에 저장
                DispatchQueue.global(qos: .userInitiated).async {
                    self.shareMyData(token: receivedData.token, peer: peer)
                }
            }
            stop()
            gameState = .ready
        } else { // 일반 전송
            let discoveryToken = receivedData.token
            
            peerDidShareDiscoveryToken(peer: peer, token: discoveryToken)
            
        }
    }

    // 내 토큰과 정보를 전달
    func shareMyDiscoveryToken(token: NIDiscoveryToken, peer: MCPeerID) {
        let tranData = TranData(token: token, isOK: myIsOK)
        
        guard let encodedData = try? NSKeyedArchiver.archivedData(withRootObject: tranData, requiringSecureCoding: false) else {
            //            fatalError("Unexpectedly failed to encode discovery token.")
            return
        }
        
        mpc?.sendData(data: encodedData, peers: [peer], mode: .unreliable)
    }
    
    // 내 데이터를 공유
    func shareMyData(token: NIDiscoveryToken, peer: MCPeerID) {
        let tranData = TranData(token: token, isBumped: true, nickname: myNickname, isOK: myIsOK)
        
        guard let encodedData = try? NSKeyedArchiver.archivedData(withRootObject: tranData, requiringSecureCoding: false) else {
            //            fatalError("Unexpectedly failed to encode discovery token.")
            return
        }
        
        mpc?.sendData(data: encodedData, peers: [peer], mode: .unreliable)
    }

    func peerDidShareDiscoveryToken(peer: MCPeerID, token: NIDiscoveryToken) {
        // 기존에 토큰을 가지고 있는 상대인데 재연결로 다시 수신받은 경우 session 종료 후 다시 시작
        if let ownedPeer = peerTokensMapping[token] {
            self.sessions[ownedPeer]?.invalidate()
            self.sessions[ownedPeer] = nil
            // 그 피어가 매치 상대일 경우 매치 상대 초기화
            if matchedObject?.token == token {
                matchedObject = nil
                //hapticManager.endHaptic()
                if !isBumped {
                    gameState = .finding
                }
            }
        }
        
        peerTokensMapping[token] = peer
        
        // 6. 피어토큰으로 NI 세션 설정
        let config = NINearbyPeerConfiguration(peerToken: token)
        
        // Run the session.
        // 7. NI 세션 시작
        DispatchQueue.global(qos: .userInitiated).async {
            self.sessions[peer]?.run(config)
        }
    }
}

// MARK: - `NISessionDelegate`.
extension NISessionManager: NISessionDelegate {
    func session(_ session: NISession, didUpdate nearbyObjects: [NINearbyObject]) {
        // Find the right peer.
        let peerObj = nearbyObjects.first { (obj) -> Bool in
            return peerTokensMapping[obj.discoveryToken] != nil
        }
        
        guard let nearbyObjectUpdate = peerObj else { return }
        
        // 범프
        if isNearby(nearbyObjectUpdate.distance ?? 10) {
            guard let peerId = peerTokensMapping[nearbyObjectUpdate.discoveryToken] else { return }
            DispatchQueue.global(qos: .userInitiated).async {
                self.shareMyData(token: nearbyObjectUpdate.discoveryToken, peer: peerId)
            }
        }
        
        // 매칭된 사람일 경우 진동 변화
//        guard let matchedToken = matchedObject?.token else { return }
//        if nearbyObjectUpdate.discoveryToken == matchedToken {
//            hapticManager.updateHaptic(dist: nearbyObjectUpdate.distance ?? 10,
//                                       matchingPercent: calMatchingKeywords(matchedObject?.keywords ?? [], myKeywords))
//        }
    }
    
    func session(_ session: NISession, didRemove nearbyObjects: [NINearbyObject], reason: NINearbyObject.RemovalReason) {
        // Find the right peer.
        let peerObj = nearbyObjects.first { (obj) -> Bool in
            return peerTokensMapping[obj.discoveryToken] != nil
        }
        
        if peerObj == nil {
            return
        }
        
        switch reason {
        case .peerEnded:
            guard let curMPCid = peerTokensMapping[peerObj!.discoveryToken] else { return }
            
            peerTokensMapping[peerObj!.discoveryToken] = nil
            
            // The peer stopped communicating, so invalidate the session because
            // it's finished.
            sessions[curMPCid]?.invalidate()
            sessions[curMPCid] = nil
            
            // Restart the sequence to see if the peer comes back.
            startup()
        case .timeout:
            // The peer timed out, but the session is valid.
            // If the configuration is valid, run the session again.
            if let config = session.configuration {
                DispatchQueue.global(qos: .userInitiated).async {
                    session.run(config)
                }
            }
        default:
            //            fatalError("Unknown and unhandled NINearbyObject.RemovalReason")
            return
        }
    }

    func sessionWasSuspended(_ session: NISession) {
    }

    func sessionSuspensionEnded(_ session: NISession) {
        // Session suspension ends. You can run the session again.
        startup()
    }

    func session(_ session: NISession, didInvalidateWith error: Error) {
        // If the app lacks user approval for Nearby Interaction, present
        // an option to go to Settings where the user can update the access.
        if case NIError.userDidNotAllow = error {
            isPermissionDenied = true
        }
        // Recreate a valid session in other failure cases.
        startup()
    }
}

// MARK: - `MultipeerConnectivityManagerDelegate`.
extension NISessionManager: MultipeerConnectivityManagerDelegate {
    func connectedDevicesChanged(devices: [String]) {
        peersCnt = devices.count
    }
}

// MARK: - 거리에 따라 반응 로직

extension NISessionManager {
    
    // 상대와의 거리가 nearbyDistanceThreshold보다 작으면 Nearby임!
    func isNearby(_ distance: Float) -> Bool {
        return distance < nearbyDistanceThreshold
    }
    
    // 매칭 상대 업데이트
    private func compareForCheckMatchedObject(_ data: TranData) {
        
        // 매칭된 object와 전달된 정보가 다르면 return
        guard self.matchedObject != data else { return }
        
        if let nowTranData = self.matchedObject {
            
        }
    }
}


