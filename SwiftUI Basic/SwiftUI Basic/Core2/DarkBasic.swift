//
//  DarkBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/23.
//

import SwiftUI

struct DarkBasic: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 20){
                    // primary and secondary color는 자동으로 다크 모드일때 색 변환 됨
                    Text("Primary 색상")
                        .foregroundColor(.primary)
                    Text("Secondary 색상")
                        .foregroundColor(.secondary)
                    
                    // 일반적인 black, white는 고정값임
                    Text("Black Color")
                        .foregroundColor(.black)
                    Text("White Color")
                        .foregroundColor(.white)
                    Text("Red Color")
                        .foregroundColor(.red)
                    
                    // Assets에서 adaptive라는 이름의 color set을 만든 후 light, dark mode에서 색을 설정해줄 수 있음
                    Text("Asset에서 Adaptive 색 설정")
                        .foregroundColor(Color("AdaptiveColor"))
                    
                    // @Enviroment 사용해서 colorScheme 사용하기
                    Text("@Environment 사용해서 Adaptive 색 설정")
                        .foregroundColor(colorScheme == .light ? .green : .blue)
                } //: VStack
            } // : ScrollView
        } // : NavigationView
        Text("Hello, World!")
    }
}

struct DarkBasic_Previews: PreviewProvider {
    static var previews: some View {
        DarkBasic()
    }
}
