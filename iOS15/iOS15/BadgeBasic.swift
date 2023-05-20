//
//  BadgeBasic.swift
//  iOS15
//
//  Created by Bokyung on 2023/04/29.
//

import SwiftUI

struct BadgeBasic: View {
    /**
     Badge: TabView의 아이콘 위에 알람 버튼이 작게 나타낼 수 있음
     */
    var body: some View {
        TabView {
            // 1번
            Color.red.ignoresSafeArea(edges: .top)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("LOVE")
                }
                .badge(0)
            
            // 2번
            Color.green.ignoresSafeArea(edges: .top)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("LOVE")
                }
                .badge(5)
            
            // 3번
            Color.blue.ignoresSafeArea(edges: .top)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("LOVE")
                }
                .badge("NEW")
        } // :TabView
        
        List {
            Text("Hello")
                .badge("New Items!")
            Text("Hello")
                .badge(10)
            Text("Hello")
                .badge("New Items!")
            Text("Hello")
                .badge(10)
            Text("Hello")
                .badge("New Items!")
            Text("Hello")
                .badge(10)
        } // :List
    }
}

struct BadgeBasic_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBasic()
    }
}
