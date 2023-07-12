//
//  ContentView.swift
//  FirebaseTest
//
//  Created by Bokyung on 2023/07/06.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

// singleton Database
let firebaseDB = ContentView().db

struct ContentView: View {
    // Cloud Firestore 인스턴스 초기화
    var db = Firestore.firestore()
    @State var selectedIndex: Int = 0
    
    var body: some View {
        // 16명(4명*4그룹) 매칭되어 있는 상태
        // 16명의 Data를 Firebase에 데이터를 추가해놓음
        TabView(selection: $selectedIndex) {
            // 16명의 user 저장하기
            MakeGroupView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("그룹 생성")
                }
                .tag(0)
            
            // 사용자 정보 수정
            ModifyUserView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("사용자 정보 수정")
                }
                .tag(1)
            
            // user 정보 불러오기
            ViewAllUsersView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("사용자 정보 보기")
                }
                .tag(2)
            
            SendHeartView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("하트보내기")
                }
                .tag(3)
        } // TabView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
