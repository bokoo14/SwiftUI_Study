//
//  PaddingBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/09.
//

import SwiftUI

struct PaddingBasic: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            Text("Hello, World!")
                .background(.yellow)
                .padding() // 기본값: .padding(.all, 15)
                .padding(.leading, 20) // css기준 padding
                .background(.blue)
                .padding(.bottom, 20) // css기준 margin
            
            Divider()
            
            // 2. padding 응용
            Text("Hello, World!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
            
            Text("안녕하세요. 헬로우 월드에 오신 여러분 환영합니다. 안녕하세요. 헬로우 월드에 오신 여러분 환영합니다. 안녕하세요. 헬로우 월드에 오신 여러분 환영합니다. 안녕하세요. 헬로우 월드에 오신 여러분 환영합니다. ")
        } // : VStack
        // VStack 범위 밖에서 padding 설정
        .padding()
        .padding(.vertical, 30) // 위아래 padding 30 설정
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.3),
                        radius: 10,
                        x: 10, y: 10)
        ) // 그림자효과주기
        .padding()
    }
}

struct PaddingBasic_Previews: PreviewProvider {
    static var previews: some View {
        PaddingBasic()
    }
}
