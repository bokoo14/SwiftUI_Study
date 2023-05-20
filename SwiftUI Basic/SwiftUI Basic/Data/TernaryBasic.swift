//
//  TernaryBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/04.
//

import SwiftUI

struct TernaryBasic: View {
    @State var isStaring: Bool = false
    
    var body: some View {
        VStack {
            // 1. if else 조건문
            Button {
                isStaring.toggle()
            } label: {
                Text("if else 버튼: \(isStaring.description)")
            }
            if isStaring {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.red)
                    .frame(width: 200, height: 100)
            } else {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.blue)
                    .frame(width: 200, height: 100)
            }
            
            
            // 2. 삼항연산자
            Button {
                isStaring.toggle()
            } label: {
                Text("삼항연산자 버튼: \(isStaring.description)")
            }
            Text(isStaring ? "빨강" : "파랑")
            if isStaring {
                Text("빨강")
            } else {
                Text("파랑")
            }
            
            RoundedRectangle(cornerRadius: isStaring ? 25.0 : 0)
                .fill(isStaring ? Color.red : Color.blue)
                .frame(width: isStaring ? 200 : 100,
                       height: isStaring ? 400 : 100)
            
            Spacer()
        }
    }
}

struct TernaryBasic_Previews: PreviewProvider {
    static var previews: some View {
        TernaryBasic()
    }
}
