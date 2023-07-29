//
//  GetHeightModifier.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/29.
//

import SwiftUI

struct ContentRectSize: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {}
}


struct GetHeightModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(GeometryReader {
                Color.clear.preference(key: ContentRectSize.self, value: $0.frame(in: .local))
            })
    }
}


// [Note]
// geo : 상위뷰에서 받아옴
// tabview: 상위뷰에서 받아옴
// scrollview: 하위뷰에서 받음
