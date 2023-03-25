//
//  MyTapVIew.swift
//  Level2
//
//  Created by Bokyung on 2023/03/25.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        // TapView
        // command + shift + L => Views를 볼 수 있음
        TabView{ // 여러 화면을 이동시켜줌
            ZStack{
                Color.orange.ignoresSafeArea()
                Text("Bokyung")
            }
            .tabItem { // tabItem 안에는 Label이 아니더라도 Text, Image를 넣어도 된다
                Text("Bokoo")
                Image(systemName: "sun.max")
            }
            
            ZStack{
                Color.yellow.ignoresSafeArea()
                Text("Luna")
            }
            .tabItem {
                Label("apple", systemImage: "moon.stars")
            }
        }
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
