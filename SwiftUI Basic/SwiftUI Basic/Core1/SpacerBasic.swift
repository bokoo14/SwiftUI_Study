//
//  SpacerBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/09.
//

import SwiftUI

struct SpacerBasic: View {
    // Spacer: View간의 간격을 일정한 간격으로 띄우고 싶을때 사용
    var body: some View {
        // 1번 padding 기본
        HStack (spacing: 0) {
            Spacer(minLength: 0)
                .frame(height: 10)
                .background(.orange)
            
            Rectangle()
                .fill(.red)
                .frame(width: 50, height: 50)
            
            Spacer(minLength: 0)
                .frame(height: 10)
                .background(.orange)
            
            Rectangle()
                .fill(.orange)
                .frame(width: 50, height: 50)
            
            Spacer(minLength: 0)
                .frame(height: 10)
                .background(.orange)
            
            Rectangle()
                .fill(.yellow)
                .frame(width: 50, height: 50)
            
            Spacer(minLength: 0)
                .frame(height: 10)
                .background(.orange)
        } // : HStack
        .background(.green)
        
        // 2번 - App 상단 설정 닫기 아이콘 만들기
        VStack {
            HStack (spacing: 0) {
                Image(systemName: "xmark")
                
                Spacer()
                
                Image(systemName: "gear")
            } // : HStack
            Spacer()
        }
        .font(.title)
        .padding(.horizontal) // 좌우 여백
    }
}

struct SpacerBasic_Previews: PreviewProvider {
    static var previews: some View {
        SpacerBasic()
    }
}
