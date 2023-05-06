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
    
    var body: some View {
        NavigationView{
            ZStack {
                
                if isLocalNetworkPermissionDenied || niObject.isPermissionDenied {
                    PermissionCheckView()
                } else {
                    ZStack {
                        VStack{
                            switch
                            niObject.gameState{
                            case.ready:
                                Text("gameState: ready")
                            case.finding:
                                Text("gameState: finding\n 찾은 peer 수: \(niObject.peersCnt)")
                            case.found:
                                Text("gameState: found")
                            }
                            Spacer().frame(height:600)
                        }
                        
                        VStack {
                            Spacer()
                                .frame(height: 120 + 54)
                            
                            switch niObject.gameState {
                            case .ready:
                                Text("Burning Buddy is ready!")
                            case .finding:
                                Text("찾은 peer 수: \(niObject.peersCnt)")
                            case .found:
                                Text("found!")
                            } // :Switch - niObject.gameState
                        }
                        
                        VStack {
                            Spacer()
                            if niObject.gameState != .ready {
                                Text("Tip Change View")
                                    .padding(.bottom, 10)
                            }
                        }
                    }
                }
                
                HomeMainButton(state: $niObject.gameState) {
                    withAnimation {
                        switch niObject.gameState {
                        case .ready:
                            niObject.start()
                            niObject.gameState = .finding
                            if isLaunched {
                                localNetAuth.requestAuthorization { auth in
                                    isLocalNetworkPermissionDenied = !auth
                                }
                                isLaunched = false
                            }
                        case .finding:
                            niObject.stop()
                            niObject.gameState = .ready
                        case .found:
                            niObject.stop()
                            niObject.gameState = .ready
                        }
                    }
                }
            }
//            .toolbar{
//                ToolbarItemGroup(placement:.navigationBarTrailing) {
//                    NavigationLink {
//                        //ProfileView()
//                        Text("ProfileView")
//                    } label: {
//                        Image(systemName: "pencil.circle")
//                            .resizable()
//                            .frame(width:35*1.2, height:35*1.2)
//                    }
//                    .offset(
//                        x : niObject.gameState == .ready ? 0 : 100,
//                        y : niObject.gameState == .ready ? 0 : -100
//                    )
//                }
//            } //: toolbar
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
         Text("\(niObject.bumpedName)")
        } //: sheet
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}




