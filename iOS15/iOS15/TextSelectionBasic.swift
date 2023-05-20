//
//  TextSelectionBasic.swift
//  iOS15
//
//  Created by Bokyung on 2023/04/29.
//

import SwiftUI

struct TextSelectionBasic: View {
    /**
     TextSelection: Text를 길게 눌렀을때 copy와 share가 자동으로 생성
     */
    var body: some View {
        Text("길게 누르면 복사 및 공유가 됩니다")
            .font(.title2)
            .textSelection(.enabled)
    }
}

struct TextSelectionBasic_Previews: PreviewProvider {
    static var previews: some View {
        TextSelectionBasic()
    }
}
