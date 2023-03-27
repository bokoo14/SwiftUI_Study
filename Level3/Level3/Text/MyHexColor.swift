//
//  MyHexColor.swift
//  Level3
//
//  Created by Bokyung on 2023/03/26.
//

import SwiftUI

struct MyHexColor: View {
    var body: some View {
        ZStack{
            // FFDD4A
            // 255 221 74
            // Color(red: 255/255.0, green: 221/255.0, blue: 74/255.0)
            Color(0xFFAD4D) // extension을 통해서 hex값을 받아서 사용할 수 있음
        }
    }
}

// hex값을 매개변수로 받을 수 있도록 extension
extension Color {
    // hex값과 투명도를 입력받음
    init(_ hex: UInt, alpha: Double = 1){
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double((hex >> 0) & 0xFF) / 255,
            opacity: alpha
        )
    }
}

struct MyHexColor_Previews: PreviewProvider {
    static var previews: some View {
        MyHexColor()
    }
}
