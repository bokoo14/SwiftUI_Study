//
//  IndividualCorner.swift
//  WeatherEx
//
//  Created by Bokyung on 2023/05/29.
//

import SwiftUI

// rect의 각각의 corner에 radius를 얼마나 줄지 정함
struct IndividualCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

