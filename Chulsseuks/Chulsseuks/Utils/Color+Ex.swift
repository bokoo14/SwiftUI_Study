//
//  Color+Ex.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/03.
//

// 사용법: .background(Color.customGray.opacity(0.75))

import SwiftUI

// custom color - can use without "#"
extension Color {
    static let backgroundColor = Color(hex: "#F2F2F6")
    static let buttonColor = Color(hex: "#B4B3E6")
    static let iconColor = Color(hex: "#5756CE")

    static let redColor = Color(hex: "#EB4D3D")
    static let yellowColor = Color(hex: "F09A37")
    static let greenColor = Color(hex: "65C466")

    static let TextColor = Color(hex: "8483F7")
    static let iColor = Color(hex: "BCBCC1")
    static let ModalColor = Color(hex: "5756CE")

    // dark mode
    static let backgroundColor2 = Color(hex: "#2C2C2D")
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


struct CustomColor {
    static let backgroundColor = Color(#colorLiteral(red: 0.6274509804, green: 0.6274509804, blue: 0.6274509804, alpha: 1))
    static let scriptColor = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    // Add more here...
    
}
