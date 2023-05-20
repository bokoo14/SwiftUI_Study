//
//  ShapeBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/09.
//

import SwiftUI

struct ShapeBasic: View {
    var body: some View {
        
        VStack (spacing: 20) {
            // circle 원형
            Text("원형")
            Circle()
                //.fill(.blue)
                //.foregroundColor(.red)
                //.stroke(.red, lineWidth: 20) // 테두리 설정
                //.stroke(.purple, style: StrokeStyle(lineWidth: 30, lineCap: .butt, dash: [30])) // butt가 30픽셀마다 나타남
                .trim(from: 0.2, to: 1.0) // 원을 자름
                .stroke(.purple, lineWidth: 20)
                .frame(width: 100, height: 100)
                .padding()
            
            // ellipse 타원형
            Text("타원형")
                .font(.title)
            Ellipse()
                .fill(.green)
                .frame(width: 200, height: 100)
            
            // 캡슐형
            Text("캡슐형")
                .font(.title)
            Capsule(style: .circular)
                .stroke(.blue, lineWidth: 30)
                .frame(width: 200, height: 100)
        }
        
        
        VStack(spacing: 20) {
            // 직사각형
            Text("직사각형")
                .font(.title)
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 100, alignment: .center)
            
            // 둥근직사각형
            Text("둥근직사각형")
                .font(.title)
            RoundedRectangle(cornerRadius: 20)
                .trim(from: 0.4, to: 1.0)
                .fill(.blue)
//                .frame(width: 200, height: 100, alignment: .center)
        }
        
    }
}

struct ShapeBasic_Previews: PreviewProvider {
    static var previews: some View {
        ShapeBasic()
    }
}
