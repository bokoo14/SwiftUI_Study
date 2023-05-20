//
//  FrameBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/09.
//

import SwiftUI

struct FrameBasic: View {
    var body: some View {
        VStack (spacing: 20){
            // 1
            Text("Hello World")
                .font(.title)
                .background(.green) // 글씨 자체의 배경은 green
                .frame(width: 200, height: 200, alignment: .center)
                .background(.red) // 200*200 프레임의 배경은 red
            
            Divider()
            
            // 2
            Text("Hello World")
                .font(.title)
                .background(.green)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center) // .infinity: 차지할 수 있는 최대한으로 차지함
                .background(.red)
        } // : VStack
        
        VStack(spacing: 20) {
            Text("Hello world")
                .font(.title)
                .background(.red)
                .frame(height: 100, alignment: .top)
                .background(.orange)
                .frame(width: 200)
                .background(.purple)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.pink)
                .frame(height: 400)
                .background(.green)
                .frame(maxHeight: .infinity, alignment: .top)
                .background(.yellow)
        } // VStack
    }
}

struct FrameBasic_Previews: PreviewProvider {
    static var previews: some View {
        FrameBasic()
    }
}
