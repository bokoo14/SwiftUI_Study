//
//  LazyGrid.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/06.
//

import SwiftUI

struct LazyGrid: View {
    // LazyVGrid
    // columns의 갯수를 3개로 설정
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    
    // LazyHGrid
    // title을 1000개 변수를 생성
    // ["목록 1", "목록 2", "목록 3", ..., "목록 1000"][String]
    let title: [String] = Array(1...1000).map { "목록 \($0)"}
    
    
    // 화면 그리드 형식으로 채워줌
    let layout: [GridItem] = [
        GridItem(.flexible(maximum: 80)),
        GridItem(.flexible(maximum: 80))
    ]
    
    var body: some View {
        // 1 - LazyVGrid
        ScrollView {
            
            // Hero 부분 (위에 사진 부분)
            Rectangle()
                .fill(Color.orange)
                .frame(height: 400)
            
            LazyVGrid(columns: columns,
                      alignment: .center,
                      spacing: 6,
                      pinnedViews: [.sectionHeaders]) // Views to pin to the bounds of a parent scroll view.
            {
                // Section 1
                Section {
                    ForEach(0..<20) { index in
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 150)
                            .overlay(Text("\(index)"))
                    }
                } header: {
                    Text("Section1")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.blue)
                        .padding()
                } // : Section 1
                
                
                // Section 2
                Section {
                    ForEach(0..<20) { index in
                        Rectangle()
                            .fill(.green)
                            .frame(height: 150)
                            .overlay(Text("\(index)"))
                    }
                } header: {
                    Text("Section2")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.red)
                        .padding()
                } // : Section 2
            }
        }
        
        // 2 - LazyHGrid
        // ScrollView horizontal
        ScrollView(.horizontal){
            LazyHGrid(rows: layout, spacing: 20) {
                ForEach(title, id: \.self) { item in
                    VStack{
                        Capsule()
                            .fill(.yellow)
                            .frame(height: 30)
                        Text(item)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

struct LazyGrid_Previews: PreviewProvider {
    static var previews: some View {
        LazyGrid()
    }
}
