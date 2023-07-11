//
//  FirebaseTestApp.swift
//  FirebaseTest
//
//  Created by Bokyung on 2023/07/06.
//

import SwiftUI
// UIApplicationDelegate의 FirebaseCore 모듈과 앱 대리자가 사용하는 다른 Firebase 모듈을 가져옵니다.
import FirebaseCore
import FirebaseFirestore


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // 앱 대리자의 application(_:didFinishLaunchingWithOptions:) 메서드에서 FirebaseApp 공유 인스턴스를 구성합니다.
        FirebaseApp.configure()
        // Cloud Firestore 인스턴스를 초기화합니다
        //let db = Firestore.firestore()
        
        return true
    }
}

//@main
//struct FirebaseTestApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}


// SwiftUI를 사용하는 경우 앱 대리자를 만들고 UIApplicationDelegateAdaptor 또는 NSApplicationDelegateAdaptor를 통해 App 구조체에 연결해야 합니다. 앱 대리자 재구성도 중지해야 합니다. 자세한 내용은 SwiftUI 안내를 참조하세요.
@main
struct FirebaseTestApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
}
