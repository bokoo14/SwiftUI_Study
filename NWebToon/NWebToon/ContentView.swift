//
//  ContentView.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Note
        // 스크롤뷰는 하위뷰에서 받음
        // 탭뷰는 상위뷰에서 받음
        // 둘 다 없음
        // 탭뷰는 사라짐. 값이 없어서
        // 그럼 탭뷰에 높이값을 잡아줘야함
        // 상수로 값을 주면 안됨 왜? 디바이스마다 다르니까
        ScrollView { // 하위뷰에서 크기를 받음
            HeaderView()
            WebtoonsTabView()
            ButtonAreaView()
            FooterAreaView()
        }
        .ignoresSafeArea()
        .onAppear {
            // Scroll을 할때 bounce를 막아줌
            UIScrollView.appearance().bounces = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



// note
/**
 area의 기준
 고객에게 화면이 나가는 기준으로 View를 짠다
View는  고객에게 보여지는 기준임
 
 */
