//
//  GetHeightModifier.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/29.
//
// 해당 코드는 SwiftUI에서 View의 크기를 가져오기 위해 사용하는 ViewModifier와 PreferenceKey를 정의한 것입니다.

import SwiftUI

// ContentRectSize: 이것은 PreferenceKey 프로토콜을 준수하는 구조체로, View의 크기 정보를 저장하는 데 사용됩니다. PreferenceKey를 사용하면 자식 뷰가 값을 제공하고 부모 뷰가 해당 값을 수집할 수 있습니다.
struct ContentRectSize : PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {}
    
}

// GetHeightModifier: 이것은 ViewModifier로, View의 크기 정보를 ContentRectSize PreferenceKey에 저장하는 역할을 합니다. GeometryReader를 사용하여 View의 크기를 가져오고, 해당 크기를 ContentRectSize에 저장합니다.
// GetHeightModifier를 적용하여 해당 View의 크기를 가져올 수 있습니다.
// $0.frame(in: .local)에서 $0는 GeometryProxy로, 자식 View에 대한 부모 View의 크기 정보를 제공합니다. .frame(in: .local)은 GeometryProxy의 속성 중 하나로, 부모 View의 좌표 공간(.local)에서 자식 View의 프레임을 가져옵니다.

struct GetHeightModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(GeometryReader {
                Color.clear.preference(key: ContentRectSize.self,
                                              value: $0.frame(in: .local))
            })
    }
}



// [Note]
// geo : 상위뷰에서 받아옴
// tabview: 상위뷰에서 받아옴
// scrollview: 하위뷰에서 받음
