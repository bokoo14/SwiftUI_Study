//
//  Color+Ex.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/03.
//

// 사용법: .background(Color.customGray.opacity(0.75))

import SwiftUI

// custom color
extension Color {

   static let customGray = Color(hex: "#D9D9D9")
   static let brown = Color(hex: "897853")  // can use without "#"
}

// hex code into Color type
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
      }
}
