//
//  ScrollViewBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/09.
//

import SwiftUI

struct ScrollViewBasic: View {
    // Scroll View: 영역을 스크롤할 수 있게 만듦
    var body: some View {
        // 1번 - 세로 스크롤
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(0..<30) { index in
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.blue)
                    .overlay(
                        Text("\(index+1)번")
                            .font(.title)
                    )
            }
        } // : Scroll View - vertical
        
        // 2번 - 가로 스크롤
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(0..<30) { index in
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                        .overlay(
                            Text("\(index+1)번")
                                .font(.title)
                        )
                }
            }
        } // : Scroll View - horizontal
        
        // 3번 - 혼합
        ScrollView(.vertical, showsIndicators: true) { // 세로 방향 ScrollView
            LazyVStack {
                ForEach(0..<10) { i in
                    ScrollView(.horizontal, showsIndicators: true) { // 가로 방향 ScrollView
                        LazyHStack {
                            ForEach(0..<20) { j in
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.cyan)
                                    .frame(width: 100, height: 100)
                                    .shadow(color: .black, radius: 10, x: 5, y: 5)
                                    .overlay(
                                        VStack{
                                            Text("세로 방향\(i)")
                                            Text("가로 방향\(j)")
                                        }
                                    )
                                    .padding(CGFloat(5))
                            }
                        }
                            
                    }
                }
            }
        } // : ScrollView 혼합
        
    }
}

struct ScrollViewBasic_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewBasic()
    }
}
