//
//  FrameExtension.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/24.
//

import SwiftUI

// MARK: - ResponsiveScreen
/**
 ResponsiveScreen: 디바이스가 여러개 있는데, 디바이스마다 크기가 다르다
 미리 extension으로 설정해줌, ScreenWidth, ScreenHeight을 미리 설정해줌
 */

extension CGFloat {
    // 스크린 사이즈를 시스템이 알아서 responsive하게 저장해줌
    static let screenWidth = UIScreen.main.bounds.width // 스크린의 width
    static let screenHeight = UIScreen.main.bounds.height // 스크린의 height
}

// MARK: - Frame Modifier
extension View {
    // Vertical Center
    func vCenter() -> some View {
        self.frame(maxHeight: .infinity, alignment: .center)
    }
    
    // Vertical Top
    func vTop() -> some View {
        self.frame(maxHeight: .infinity, alignment: .top)
    }
    
    // Vertical Bottom
    func vBottom() -> some View {
        self.frame(maxHeight: .infinity, alignment: .bottom)
    }
    
    // Horizontal Center
    func hCenter() -> some View {
        self.frame(maxWidth: .infinity, alignment: .center)
    }
    
    // Horizontal Leading
    func hLeading() -> some View {
        self.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // Horizontal Trailing
    func hTrailing() -> some View {
        self.frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    
}
