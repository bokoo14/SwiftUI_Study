//
//  StackBasicView.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/09.
//

import SwiftUI

struct StackBasicView: View {
    // VStack: 세로로 나열
    // HStack: 가로로 나열
    // ZStack: 겹쳐서 나열
    var body: some View {
        // 1. VStack
        VStack(alignment: .leading, spacing: 20) {
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
            
            Rectangle()
                .fill(.green)
                .frame(width: 150, height: 150)
            
            Rectangle()
                .fill(.orange)
                .frame(width: 100, height: 100)
        }
        
        // 2. HStack
        HStack(spacing: 20) {
            Rectangle()
                .fill(.red)
                .frame(width: 100, height: 100)
            
            Rectangle()
                .fill(.green)
                .frame(width: 100, height: 100)
            
            Rectangle()
                .fill(.orange)
                .frame(width: 100, height: 100)
        }
        
        // 3. ZStack
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(.red)
                .frame(width: 150, height: 150)
            
            Rectangle()
                .fill(.green)
                .frame(width: 130, height: 130)
            
            Rectangle()
                .fill(.orange)
                .frame(width: 100, height: 100)
        }
        
        // 4. Stack 응용
        ZStack(alignment: .top) {
            Rectangle()
                .fill(.yellow)
                .frame(width: 350, height: 500)
            
            VStack (alignment: .leading, spacing: 30){
                Rectangle()
                    .fill(.red)
                .frame(width: 150, height: 150)
                
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
                
                HStack (alignment: .bottom, spacing: 10) {
                    Rectangle()
                        .fill(.purple)
                        .frame(width: 50, height: 50)
                    
                    Rectangle()
                        .fill(.pink)
                        .frame(width: 75, height: 75)
                    
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 25, height: 25)
                } // : HStack
                .background(.white)
            } // :VStack
            .background(.black)
        } // : ZStack
        
        // 5. ZStack vs Background
        VStack (spacing: 50) {
            // ZStack을 사용해서 원에 1을 표현 - layer가 복잡할때 ZStack을 사용하면 좋음
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                Text("1")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            // Background를 사용해서 원에 1을 동일하게 표현 - layer가 단순할 경우 추천
            Text("1")
                .font(.title)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .fill(.black)
                        .frame(width: 100, height: 100)
                )
            
        }
    }
}

struct StackBasicView_Previews: PreviewProvider {
    static var previews: some View {
        StackBasicView()
    }
}
