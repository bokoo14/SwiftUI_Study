//
//  ViewBuilder.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/06/25.
//

import SwiftUI

@ViewBuilder
func imageLayout<Content: View>
(imageTitle: String, overlayAlignment: Alignment, leadingOffset:Double, topOffset: Double,  @ViewBuilder content: () -> Content) -> some View {
    VStack {
        Image(imageTitle)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .overlay(alignment: overlayAlignment) {
                VStack (spacing: 4){
                    content()
                }
                .offset(x: leadingOffset, y: topOffset)
            }
    }
}

// 구글링, 완성되어 있는 코드를 봐야 한다 기능이 완성되어 있는 코드를 봐야 한다
// 이해가 안가는 코드를 공부하기 ..

@ViewBuilder
func imageLayout2<Content: View>
(imageTitle: String, overlayAlignment: Alignment, leadingOffset:Double, topOffset: Double,  @ViewBuilder content: () -> Content) -> some View {
    VStack {
        Image(imageTitle)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .overlay(alignment: overlayAlignment) {
                VStack (spacing: 0){
                    content()
                }
                .offset(x: leadingOffset, y: topOffset)
            }
    }
}
