//
//  MainView.swift
//  ChartTest
//
//  Created by Bokyung on 1/25/24.
//

import SwiftUI


struct MainView: View {
    @State var showEvolution = false
    @State var mainViewNavLinkActive: Bool = false
    @State private var showOnboarding: Bool = UserDefaults.standard.bool(forKey: "showOnboarding")
    @State private var beforeStart: Bool = false
    @State private var alertIsActive: Bool = false // Alert 표시 여부를 관리하기 위한 상태 변수

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                    Button("운동 시작하기") {
                        self.beforeStart = true
                    }
                        .alert(isPresented: $beforeStart) {
                    Alert(
                        title: Text("애플워치를 착용하고 있나요?"),
                        message: Text("애플워치를 착용한 후 운동 앱을 실행해주세요. 운동량 측정을 통해 캐릭터를 성장시킬 수 있습니다."),
                        primaryButton: .destructive(Text("뒤로가기")) {
                            print("tap cancel")
                        },
                        secondaryButton: .cancel(Text("착용했어요")) {
                            UserDefaults.standard.set(true, forKey: "isWorkouting")
                            self.beforeStart = false
                            self.mainViewNavLinkActive = true
                            UserDefaults.standard.set(Date(), forKey: "workoutStartTime")
                        }
                    )
                }
                .background(NavigationLink(destination:
                                            ContentView(),
                                           isActive: $mainViewNavLinkActive,
                                           label: { EmptyView() })
                                .hidden()
                )
            }
        }
    }
}



#Preview {
    MainView()
}
