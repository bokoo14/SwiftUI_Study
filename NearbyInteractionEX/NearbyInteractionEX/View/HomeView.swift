//
//  HomeView.swift
//  NearbyInteractionEX
//
//  Created by Bokyung on 2023/05/05.
//

import SwiftUI

struct HomeView: View {
    let localNetAuth = LocalNetworkAuthorization()
    @StateObject var niObject = NISessionManager()
    @State var isLocalNetworkPermissionDenied = false
    @Environment(\.scenePhase) var scenePhase
    
    @State var isLaunched = true
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var myName: String = ""
    
    var body: some View {
        NavigationView{
            ZStack {
                if isLocalNetworkPermissionDenied || niObject.isPermissionDenied {
                    PermissionCheckView()
                } else {
                        VStack{
                            switch
                            niObject.gameState{
                            case.ready:
                                VStack {
                                    Text("gameState: ready")
                                    TextField("Enter your name", text: $myName)
                                        .onSubmit {
                                            CoreDataManager.coreDM.createUser(userName: myName)
                                        }
                                }
                            case.finding:
                                Text("gameState: finding\n 찾은 peer 수: \(niObject.peersCnt)")
                            case.found:
                                Text("gameState: found")
                            }
                            Spacer().frame(height:600)
                        } // :VStack - switch gameState
                } // :else
                
                HomeMainButton(state: $niObject.gameState) {
                    
                    CoreDataManager.coreDM.readAllUser()[0].userName = myName
                    CoreDataManager.coreDM.updateUser()
                    
                    withAnimation {
                        switch niObject.gameState {
                        case .ready:
                            niObject.start()
                            niObject.gameState = .finding
                            
                            // 앱이 처음 실행될 때만 로컬 네트워크 권한 요청이 발생하도록 제어할 수 있음. 초기 실행 시에만 로컬 네트워크 권한을 요청하고, 이후 실행에서는 필요한 시점에 따라 권한을 다시 확인함
                            if isLaunched {
                                localNetAuth.requestAuthorization { auth in
                                    isLocalNetworkPermissionDenied = !auth
                                }
                                isLaunched = false
                            } //: if launched
                        // finding과 found의 차이는 뭐지?
                        case .finding:
                            niObject.stop() // finding인데 왜 stop해줘야 하나?
                            niObject.gameState = .ready
                        case .found:
                            niObject.stop()
                            niObject.gameState = .ready
                        } // :switch - gameState
                    } // :withAnimation
                } // :HomeMainButton
            }
        }
        .onChange(of: scenePhase) { newValue in
            if !isLaunched {
                localNetAuth.requestAuthorization { auth in
                    isLocalNetworkPermissionDenied = !auth
                }
            }
        } // :onChange
        .sheet(isPresented: $niObject.isBumped) {
            niObject.gameState = .ready
            niObject.stop()
        } content: {
            Match(nickName: niObject.bumpedName)
        } //: sheet - 두 디바이스가 접촉을 했을때 sheet이 올라옴
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}




