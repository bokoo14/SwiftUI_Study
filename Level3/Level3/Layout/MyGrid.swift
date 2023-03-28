//
//  MyGrid.swift
//  Level3
//
//  Created by Bokyung on 2023/03/29.
//

import SwiftUI

struct MyGrid: View {
    // grid: 바둑판식 레이아웃을 그려줌
    var body: some View {
        LazyVGrid(columns: [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))]) {
            Text("1")
                .frame(width: 100, height: 100)
                .background(.purple)
            Text("2")
                .frame(width: 100, height: 100)
                .background(.purple)
            Text("3")
                .frame(width: 100, height: 100)
                .background(.purple)
            Text("4")
                .frame(width: 100, height: 100)
                .background(.purple)
            Text("5")
                .frame(width: 100, height: 100)
                .background(.purple)
            Text("6")
                .frame(width: 100, height: 100)
                .background(.purple)
        }
    }
}

struct MyGrid_Previews: PreviewProvider {
    static var previews: some View {
        MyGrid()
    }
}
