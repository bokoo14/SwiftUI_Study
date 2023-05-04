/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view controller that facilitates the sample app's primary user experience.
*/

import UIKit
import NearbyInteraction
import MultipeerConnectivity
/*
 출처: https://developer.apple.com/documentation/nearbyinteraction/discovering_peers_with_multipeer_connectivity
 멀티피어커넥팅: 로컬 네트워크를 통해 검색 토큰을 교환한다.
 앱이 피어를 찾으면 NISession을 만들고 네트워크 기술을 사용해 세션의 discoveryToken을 피어로 보낸다.
 멀티피어커넥팅 사용해 주변 피어를 찾고 discoveryToken을 교환한다.
 
 멀티피어커넥팅을 사용하기 위해, info.plist에 NSBonjourServices 키가 있어야한다.
 .tcp와 .udp를 포함해 다음 규칙을 따른다.
 
 <key>NSBonjourServices</key>
 <array>
     <string>_myAppName._tcp</string>
     <string>_myAppName._udp</string>
 </array>
 
 사용자에게 로컬 네트워크를 사용할 수 있는 앱 명시적 권한을 부여하라는 메시지를 표시하기 위해, 앱에 NSLocalNetworkUsageDescription 키를 포함해야 한다.
 
 */

class ViewController2: UIViewController, NISessionDelegate {

    // MARK: - `IBOutlet` instances.
    @IBOutlet weak var monkeyLabel: UILabel!
    @IBOutlet weak var centerInformationLabel: UILabel!
    @IBOutlet weak var detailContainer: UIView!
    @IBOutlet weak var detailAzimuthLabel: UILabel!
    @IBOutlet weak var detailDeviceNameLabel: UILabel!
    @IBOutlet weak var detailDistanceLabel: UILabel!
    @IBOutlet weak var detailDownArrow: UIImageView!
    @IBOutlet weak var detailElevationLabel: UILabel!
    @IBOutlet weak var detailLeftArrow: UIImageView!
    @IBOutlet weak var detailRightArrow: UIImageView!
    @IBOutlet weak var detailUpArrow: UIImageView!
    @IBOutlet weak var detailAngleInfoView: UIView!

    // MARK: - Distance and direction state.
    
    // 앱이 디스플레이를 업데이트 하는 데 사용되는 값
    let nearbyDistanceThreshold: Float = 0.3

    // 거리와 방향에 대한 상태를 담고 있다.
    enum DistanceDirectionState {
        case closeUpInFOV, notCloseUpInFOV, outOfFOV, unknown
    }
    
    // MARK: - Class variables
    var session: NISession? // NISession 생성 - NI 정보를 담고 있음
    var peerDiscoveryToken: NIDiscoveryToken? // 주고 받을 토큰
    let impactGenerator = UIImpactFeedbackGenerator(style: .medium) // 물리적인 임팩트를 시뮬레이션하기 위한 햅틱을 생성하는 feedback generator 클래스
    var currentDistanceDirectionState: DistanceDirectionState = .unknown // 현재 거리방향 상태를 나타내는 변수 - unknown으로 초기화
    var mpc: MPCSession? // 멀티피어 커넥팅 정보를 담은 Session
    var connectedPeer: MCPeerID? // 커넥트된 피어 정보 - ID
    var sharedTokenWithPeer = false // 토큰이 공유되었는지를 담는 부울값
    var peerDisplayName: String? // 피어의 이름

    // MARK: - UI life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        monkeyLabel.alpha = 0.0
        monkeyLabel.text = "🙈"
        centerInformationLabel.alpha = 1.0
        detailContainer.alpha = 0.0
        
        // 인터랙션 세션 시작
        startup()
    }

    func startup() {
        // NISession 생성
        session = NISession()
        
        // 딜리게이트 설정 Set the delegate.
        session?.delegate = self
        
        // 세션이 새로 생성된 애니까, token-shared 플래그를 초기화해준다. Because the session is new, reset the token-shared flag.
        sharedTokenWithPeer = false

        // 연결된 peer가 존재한다면 필요하면 discovery token 을 공유한다. If `connectedPeer` exists, share the discovery token, if needed.
        if connectedPeer != nil && mpc != nil { // 연결된 피어와 mpc 가 nil이 아닐 때 : 연결되었을 때. 1️⃣ Start
            if let myToken = session?.discoveryToken { // 내 토큰이 존재하는지 확인해주고
                updateInformationLabel(description: "Initializing ...") // TODO: - 라벨을 업데이트한다.
                if !sharedTokenWithPeer { // 토큰이 공유되지 않은 상태면
                    shareMyDiscoveryToken(token: myToken) // TODO: - 토큰 공유 함수 실행한다.
                }
                guard let peerToken = peerDiscoveryToken else { // 공유받은 토큰을 peerToken 변수에 저장해준다.
                    return
                }
                let config = NINearbyPeerConfiguration(peerToken: peerToken) // 세션 내의 run 함수를 이용해 이 인스턴스를 전달하면 피어 인터랙션이 시작된다.
                session?.run(config) // 인스턴스 전달, 인터랙션 시작 함수
            } else {
                fatalError("Unable to get self discovery token, is this session invalidated?")
            }
        } else { // 1️⃣ End. 연결된 피어가 존재하지 않는 경우
            updateInformationLabel(description: "Discovering Peer ...") // 라벨을 '피어를 찾는 중..'으로 변경
            startupMPC() // MPC를 이용해 discovery 토큰을 공유하고 수신하는 함수.
            
            // display state를 .unknown으로 변경해준다. Set the display state.
            currentDistanceDirectionState = .unknown
        }
    }

    // MARK: - `NISessionDelegate`. 니어바이인터랙션 딜리게이트 부분
    // NINearbyObject는 인터랙션 세션 내의 피어의 위치 정보를 담는 객체이다.
    // 이 객체는 근처에 있는 Apple 기기나 써드파티 액세서리를 가리킨다.
    // 만약 세션이 피어의 방향, 거리를 제공할 수 없는 상태이면 각 값은 nil이 된다.
    // 아래의 didUpdate 메서드는 NINearbyObject의 딜리게이트에 포함된 함수로, 앱이 가까이 위치한 물체에 대한 정보를 제공할 준비가 되면 호출된다.
    func session(_ session: NISession, didUpdate nearbyObjects: [NINearbyObject]) { // 업데이트 되었을 때 함수
        guard let peerToken = peerDiscoveryToken else { // peerDiscoveryToken을 peerToken 변수에 할당.
            fatalError("don't have peer token") // 실패하면 에러 메세지
        }

        // Find the right peer. - 알맞는 peer를 찾는다
        let peerObj = nearbyObjects.first { (obj) -> Bool in // nearbyObjects 배열에 있는 가장 첫 요소를 peerObj로 배정
            return obj.discoveryToken == peerToken // obj의 discoveryToken이 peerToken과 맞는지 체크
        }

        guard let nearbyObjectUpdate = peerObj else { // peerObj를 nearbyObjectUpdate 변수에 배정한다.
            return
        }

        // 상태 업데이트, 시각화 업데이트
        // Update the the state and visualizations.
        let nextState = getDistanceDirectionState(from: nearbyObjectUpdate) // peerObj에 대한 distance와 direction 상태를 체크한 뒤 다음 상태를 nextState에 저장해준다.
        updateVisualization(from: currentDistanceDirectionState, to: nextState, with: nearbyObjectUpdate) // peerObj를 이용해 비주얼 업데이트 및 햅틱(?)
        currentDistanceDirectionState = nextState // 현재 상태를 다음 상태로 업데이트.
    }

    // Notifies you when the session removes one or more nearby objects. - session이 하나 혹은 그 이상의 nearby object를 제거할때 알려줌
    func session(_ session: NISession, didRemove nearbyObjects: [NINearbyObject], reason: NINearbyObject.RemovalReason) { // 뭔데??
        guard let peerToken = peerDiscoveryToken else { // peerDiscoveryToken이 nil이면
            fatalError("don't have peer token") // peer token이 없다는 에러 전달
        }
        
        // 알맞는 peer 찾기
        // Find the right peer.
        let peerObj = nearbyObjects.first { (obj) -> Bool in
            return obj.discoveryToken == peerToken // discoveryToken이 nearbyObjects의 가장 첫 번째 peer의 토큰과 일치하는지 여부를 peerObj에 저장한다. (true or false)
        }
        // 알맞은 peer가 없으면 그냥 return
        if peerObj == nil { // nil이면 그냥 리턴.
            return
        }

        
        currentDistanceDirectionState = .unknown // remove되었으니 현재상태를 .unknown으로 돌려놓는다.

        switch reason { // remove된 이유에 따라 switch-case
        case .peerEnded: // peer가 종료했을때
            // The peer token is no longer valid.
            peerDiscoveryToken = nil // 피어 토큰이 더 이상 존재하지 않게 하고
            
            // The peer stopped communicating, so invalidate the session because
            // it's finished.
            session.invalidate()
            
            // Restart the sequence to see if the peer comes back.
            startup()
            
            // Update the app's display.
            updateInformationLabel(description: "Peer Ended")
        case .timeout: // 시간초과
            
            // The peer timed out, but the session is valid.
            // If the configuration is valid, run the session again.
            if let config = session.configuration {
                session.run(config)
            }
            updateInformationLabel(description: "Peer Timeout")
        default: // 이유가 peer종료와 시간초과 외의 것이라면
            fatalError("Unknown and unhandled NINearbyObject.RemovalReason")
        }
    }

    
    // Managing Interruption - sessionWasSuspended, sessionSuspensionEnded
    // Notifies you of a suspended session. - 일시중단된 session을 알려줌
    func sessionWasSuspended(_ session: NISession) {
        currentDistanceDirectionState = .unknown
        updateInformationLabel(description: "Session suspended")
    }

    // Notifies you of the end of a session's suspension. - session의 일시중단이 종료되었음을 알려줌
    func sessionSuspensionEnded(_ session: NISession) {
        // Session suspension ended. The session can now be run again. - session이 다시 실행될 수 있음
        if let config = self.session?.configuration {
            session.run(config)
        } else {
            // Create a valid configuration.
            startup()
        }

        centerInformationLabel.text = peerDisplayName
        detailDeviceNameLabel.text = peerDisplayName
    }
    
    // Handling Errors
    // Notifies you of an invalidated session. - invalidated session을 가지고 있다면 알려줌
    func session(_ session: NISession, didInvalidateWith error: Error) {
        currentDistanceDirectionState = .unknown

        // If the app lacks user approval for Nearby Interaction, present
        // an option to go to Settings where the user can update the access.
        // 사용자 승인이 없는 경우, 사용자가 액세스를 업데이트할 수 있는 설정으로 이동하는 옵션
        if case NIError.userDidNotAllow = error {
            if #available(iOS 15.0, *) {
                // In iOS 15.0, Settings persists Nearby Interaction access.
                updateInformationLabel(description: "Nearby Interactions access required. You can change access for NIPeekaboo in Settings.")
                // Create an alert that directs the user to Settings.
                let accessAlert = UIAlertController(title: "Access Required",
                                                    message: """
                                                    NIPeekaboo requires access to Nearby Interactions for this sample app.
                                                    Use this string to explain to users which functionality will be enabled if they change
                                                    Nearby Interactions access in Settings.
                                                    """,
                                                    preferredStyle: .alert)
                accessAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                accessAlert.addAction(UIAlertAction(title: "Go to Settings", style: .default, handler: {_ in
                    // Send the user to the app's Settings to update Nearby Interactions access.
                    if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                    }
                }))

                // Display the alert.
                present(accessAlert, animated: true, completion: nil)
            } else {
                // Before iOS 15.0, ask the user to restart the app so the
                // framework can ask for Nearby Interaction access again.
                updateInformationLabel(description: "Nearby Interactions access required. Restart NIPeekaboo to allow access.")
            }

            return
        }

        // Recreate a valid session.
        startup()
    }

    // MARK: - Discovery token sharing and receiving using MPC.
    // MPC를 이용해 discovery 토큰을 공유하고 수신한다.
    // 발견된 토큰을 공유하고 MPC를 사용해서 토큰을 받음
    // MPC를 시작하는 로직
    func startupMPC() { // TODO: - MultiPeerConnecting 시작하는 함수
        if mpc == nil { // mpc가 nil이면
            // Prevent Simulator from finding devices.
            #if targetEnvironment(simulator)
            mpc = MPCSession(service: "nisample", identity: "com.example.apple-samplecode.simulator.peekaboo-nearbyinteraction", maxPeers: 1)
            #else
            mpc = MPCSession(service: "nisample", identity: "com.example.apple-samplecode.peekaboo-nearbyinteraction", maxPeers: 1)
            #endif
            mpc?.peerConnectedHandler = connectedToPeer
            mpc?.peerDataHandler = dataReceivedHandler
            mpc?.peerDisconnectedHandler = disconnectedFromPeer
        }
        mpc?.invalidate()
        mpc?.start()
    }
    
    // 피어와 연결하는 함수
    func connectedToPeer(peer: MCPeerID) {
        guard let myToken = session?.discoveryToken else {
            fatalError("Unexpectedly failed to initialize nearby interaction session.")
        }

        if connectedPeer != nil { // 연결된 피어가 nil이 아니면
            fatalError("Already connected to a peer.") // 이미 연결되어있음을 알려준다.
        }

        if !sharedTokenWithPeer { // 피어와 토큰이 공유되었는지 확인하는 부울값이 false이면
            shareMyDiscoveryToken(token: myToken) // 피어와 토큰을 공유하는 함수를 실행한다.
        }

        connectedPeer = peer // 연결된 피어 값을 저장하고,
        peerDisplayName = peer.displayName // displayName을 저장한다.

        centerInformationLabel.text = peerDisplayName // 라벨 값을 바꾼다.
        detailDeviceNameLabel.text = peerDisplayName
    }
    // 피어로부터 disconnect 하는 함수
    func disconnectedFromPeer(peer: MCPeerID) {
        if connectedPeer == peer { // peer가 연결되어있는 피어가 맞으면 상태 초기화
            connectedPeer = nil
            sharedTokenWithPeer = false
        }
    }
    // peerID와 data를 받아와서 token을 전달하는 함수
    func dataReceivedHandler(data: Data, peer: MCPeerID) {
        guard let discoveryToken = try? NSKeyedUnarchiver.unarchivedObject(ofClass: NIDiscoveryToken.self, from: data) else {
            fatalError("Unexpectedly failed to decode discovery token.")
        }
        peerDidShareDiscoveryToken(peer: peer, token: discoveryToken)
    }

    func shareMyDiscoveryToken(token: NIDiscoveryToken) {
        guard let encodedData = try?  NSKeyedArchiver.archivedData(withRootObject: token, requiringSecureCoding: true) else {
            fatalError("Unexpectedly failed to encode discovery token.")
        }
        mpc?.sendDataToAllPeers(data: encodedData)
        sharedTokenWithPeer = true
    }
    // 전달받은 token을 connectedPeer의 토큰이 맞는지 확인하고, 인터랙션을 시작하는 함수이다.
    func peerDidShareDiscoveryToken(peer: MCPeerID, token: NIDiscoveryToken) {
        if connectedPeer != peer { // peer가 connectedPeer와 일치하는지 여부 파악
          fatalError("Received token from unexpected peer.") // 안 맞으면 예상하지 못한 피어에게서 토큰을 받아왔어~
        }
        // Create a configuration.
        peerDiscoveryToken = token // 토큰을 peerDiscoveryToken에 저장

        let config = NINearbyPeerConfiguration(peerToken: token) // 토큰에 해당하는 config 생성

        // Run the session.
        session?.run(config) // 두 디바이스 간 인터랙션 시작하는 함수
    }

    // MARK: - Visualizations
  
    // isNearby함수는 인자로 할당되는 distance가 우리가 지정한 임계값보다 작으면 True를, 크면 false를 할당한다.
    // 말 그대로 근처에 있는지를 판단해주는 함수이다.
    func isNearby(_ distance: Float) -> Bool {
        return distance < nearbyDistanceThreshold
    }

    func isPointingAt(_ angleRad: Float) -> Bool {
        // Consider the range -15 to +15 to be "pointing at".
        return abs(angleRad.radiansToDegrees) <= 15
    }

    // getDistanceDirectionState 함수는 NINearbyObject를 인자로 사용하며,
    // from: 인자를 받을 때 별명, 함수 내에서는 nearbyObject로 쓰임.
    func getDistanceDirectionState(from nearbyObject: NINearbyObject) -> DistanceDirectionState {
        if nearbyObject.distance == nil && nearbyObject.direction == nil { // nearbyObject의 거리와 방향이 nil이라면? -> 세션이 피어에 대한 정보를 제공할 수 없는 상태이니
            return .unknown // 상태를 .unknown으로 만들어준다.
        }

        // nearbyObject에 있는 distance 속성을 isNearby함수의 인자로 전달해 나온 결과값(부울값)을 isNearby에 할당한다. 만약 그 값이 nil이라면 false를 할당한다.
        let isNearby = nearbyObject.distance.map(isNearby(_:)) ?? false
        let directionAvailable = nearbyObject.direction != nil // nearbyOjbect의 direction 값이 비어있으면 directionAvailable은 false, 비어있지 않다면 true가 할당된다.

        if isNearby && directionAvailable {
            return .closeUpInFOV
        } // 근처에 있고 direction이 있다면 cloaseUpInFOV 상태를 리턴한다.

        if !isNearby && directionAvailable {
            return .notCloseUpInFOV
        } // 근처에 없고 direction이 있다면 notCloseUpInFOV 상태를 리턴한다.

        return .outOfFOV // unknown도 아니며 다른 상태에도 해당하지 않는다면 outOfFOV 상태를 리턴한다.
    }
    
    // 애니메이션 함수
    private func animate(from currentState: DistanceDirectionState, to nextState: DistanceDirectionState, with peer: NINearbyObject) {
        let azimuth = peer.direction.map(azimuth(from:))
        let elevation = peer.direction.map(elevation(from:))

        centerInformationLabel.text = peerDisplayName
        detailDeviceNameLabel.text = peerDisplayName
        
        // If the app transitions from unavailable, present the app's display
        // and hide the user instructions.
        if currentState == .unknown && nextState != .unknown {
            monkeyLabel.alpha = 1.0
            centerInformationLabel.alpha = 0.0
            detailContainer.alpha = 1.0
        }
        
        if nextState == .unknown {
            monkeyLabel.alpha = 0.0
            centerInformationLabel.alpha = 1.0
            detailContainer.alpha = 0.0
        }
        
        if nextState == .outOfFOV || nextState == .unknown {
            detailAngleInfoView.alpha = 0.0
        } else {
            detailAngleInfoView.alpha = 1.0
        }
        
        // 피어의 다음 상태에 따라 멍키라벨 변화
        // Set the app's display based on peer state.
        switch nextState {
        case .closeUpInFOV:
            monkeyLabel.text = "🙉"
        case .notCloseUpInFOV:
            monkeyLabel.text = "🙈"
        case .outOfFOV:
            monkeyLabel.text = "🙊"
        case .unknown:
            monkeyLabel.text = ""
        }
        
        if peer.distance != nil {
            detailDistanceLabel.text = String(format: "%0.2f m", peer.distance!)
        }
        
        monkeyLabel.transform = CGAffineTransform(rotationAngle: CGFloat(azimuth ?? 0.0))
        
        // Don't update visuals if the peer device is unavailable or out of the
        // U1 chip's field of view.
        if nextState == .outOfFOV || nextState == .unknown {
            return
        }
        
        if elevation != nil {
            if elevation! < 0 {
                detailDownArrow.alpha = 1.0
                detailUpArrow.alpha = 0.0
            } else {
                detailDownArrow.alpha = 0.0
                detailUpArrow.alpha = 1.0
            }
            
            if isPointingAt(elevation!) {
                detailElevationLabel.alpha = 1.0
            } else {
                detailElevationLabel.alpha = 0.5
            }
            detailElevationLabel.text = String(format: "% 3.0f°", elevation!.radiansToDegrees)
        }
        
        if azimuth != nil {
            if isPointingAt(azimuth!) {
                detailAzimuthLabel.alpha = 1.0
                detailLeftArrow.alpha = 0.25
                detailRightArrow.alpha = 0.25
            } else {
                detailAzimuthLabel.alpha = 0.5
                if azimuth! < 0 {
                    detailLeftArrow.alpha = 1.0
                    detailRightArrow.alpha = 0.25
                } else {
                    detailLeftArrow.alpha = 0.25
                    detailRightArrow.alpha = 1.0
                }
            }
            detailAzimuthLabel.text = String(format: "% 3.0f°", azimuth!.radiansToDegrees)
        }
    }
    
    // 현재상태와 다음상태에 따라 햅틱을 재생(?)하고 비주얼 업데이트하는 함수
    func updateVisualization(from currentState: DistanceDirectionState, to nextState: DistanceDirectionState, with peer: NINearbyObject) {
        // Invoke haptics on "peekaboo" or on the first measurement.
        if currentState == .notCloseUpInFOV && nextState == .closeUpInFOV || currentState == .unknown {
            impactGenerator.impactOccurred()
        } // 현재 상태가 .notCloseUpInFOV이고 다음 상태가 closeUpInFOV인 상태 / 현재상태가 unknown일 때, impactOccurred 함수 이용해 적절한 햅틱을 재생.
      // TODO: - 햅틱 재생되는건지 체크.

        // 다음 비주얼로 변경 및 애니메이션!
        // Animate into the next visuals.
        UIView.animate(withDuration: 0.3, animations: {
            self.animate(from: currentState, to: nextState, with: peer)
        })
    }

    // 라벨 업데이트 함수
    func updateInformationLabel(description: String) {
        UIView.animate(withDuration: 0.3, animations: {
            self.monkeyLabel.alpha = 0.0
            self.detailContainer.alpha = 0.0
            self.centerInformationLabel.alpha = 1.0
            self.centerInformationLabel.text = description
        })
    }
}
