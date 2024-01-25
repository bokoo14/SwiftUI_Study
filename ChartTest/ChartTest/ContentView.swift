//
//  ContentView.swift
//  ChartTest
//
//  Created by Bokyung on 1/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var value: CGFloat = 0.0 // @State 변수 추가
    
    var body: some View {
        VStack {
            TestView(value: value) // TestView로 value 전달
                .frame(width: 249, height: 249)
            
            Button("Change Value") {
                if value < 1.0 {
                    value += 0.1 // 버튼을 눌러 value 값을 변경
                } else {
                    value = 0
                }
                
            }
        }
    }
}




#Preview {
    ContentView()
}
