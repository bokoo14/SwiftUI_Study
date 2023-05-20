//
//  Conditional.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/04.
//

import SwiftUI

struct Conditional: View {
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // 로딩 버튼
            Button {
                isLoading.toggle()
            } label: {
                Text("로드 중 .. \(isLoading.description)")
            }
            
            // 로딩 중이라면 Loading이미지를 띄워줌
            if isLoading { // if isLoading == true {}
                ProgressView()
            }
            
            // 원형 버튼
            Button {
                showCircle.toggle()
            } label: {
                Text("원형 버튼: \(showCircle.description)")
            }
            
            // 사각형 버튼
            Button {
                showRectangle.toggle()
            } label: {
                Text("사각형 버튼: \(showRectangle.description)")
            }
            
            // 조건 1: 원형 버튼이 true일때
            if showCircle {
                Circle()
                    .frame(width: 100, height: 100)
            }
            
            // 조건 2: 사각형 버튼 true일때
            if showRectangle {
                Rectangle()
                    .frame(width: 100, height: 100)
            }
            
            // 조건 3: 원형 버튼이 false 그리고 사각형 버튼이 false일때
            if showCircle == false && showRectangle == false { // && = and
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 200, height: 100)
            }
            
            // 조건 4: 원형 버튼 true 또는 사각형 버튼 true 일때
            if showCircle || showRectangle { // || = or
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.red)
                    .frame(width: 200, height: 100)
            }
            
            Spacer()
            

        }
    }
}

struct Conditional_Previews: PreviewProvider {
    static var previews: some View {
        Conditional()
    }
}
