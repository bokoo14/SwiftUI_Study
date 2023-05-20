//
//  ColorBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/09.
//

import SwiftUI

struct ColorBasic: View {
    var body: some View {
        VStack {
            // Basic color
            Text("Basic Color")
                .font(.title)
            RoundedRectangle(cornerRadius: 20)
                .fill(.purple)
                .frame(width: 300, height: 100)
            
            // Primary color
            // 자동으로 다크모드 지원
            Text("Primary Color")
                .font(.title)
            RoundedRectangle(cornerRadius: 20)
                //.fill(.secondary)
                .fill(.primary)
                .frame(width: 300, height: 100)
            
            // UIColor
            // UIKit에서 사용되는 Color값을 사용할 수 있음
            Text("UI Color")
                .font(.title)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(uiColor: UIColor.secondarySystemBackground))
                .frame(width: 300, height: 100)
            
            // Custom Color
            Text("Custom Color")
                .font(.title)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("CustomColor"))
                .frame(width: 300, height: 100)
            
        }
        
    }
}

struct ColorBasic_Previews: PreviewProvider {
    static var previews: some View {
        ColorBasic()
            //.preferredColorScheme(.dark) // 다크모드
    }
}
