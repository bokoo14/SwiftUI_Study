//
//  SafeAreaBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/09.
//

import SwiftUI

struct SafeAreaBasic: View {
    var body: some View {
        // 1번 화면
        ZStack {
            Color.blue
                //.ignoresSafeArea(edges: .top) // 위쪽만 ignoreSafeArea
                .ignoresSafeArea()
            Text("Hello World")
                .font(.title)
        } // : ZStack
        
        // 2번 화면
        ScrollView {
            VStack {
                Text("박스형 리스트")
                    .font(.title)
                    .frame(maxWidth: .infinity) // text의 넓이를 화면의 최대 크기로
                
                ForEach(1..<11) { index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding()
                        .overlay(
                            Text("\(index)")
                                .font(.title)
                        )
                    
                }
            }
        } // : ScrollView
        .background(Color.blue
            .ignoresSafeArea())
        
    }
}

struct SafeAreaBasic_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaBasic()
    }
}
