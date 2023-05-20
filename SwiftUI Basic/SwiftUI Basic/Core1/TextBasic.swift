//
//  TextBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/09.
//

import SwiftUI

struct TextBasic: View {
    var body: some View {
        VStack {
            // font 사이즈를 title, body, footnote 등 정하면 responsive
            Text("Hello, World!")
                .font(.title)
                .fontWeight(.semibold)
                .bold()
                .underline(true, color: .red)
                .italic()
                .strikethrough(true, color: .green)
            
            // 이 방법으로 하게 되면 Text 크기를 지정할 수 있음
            Text("Hello world2".uppercased())
                .font(.system(size: 25, weight: .semibold, design: .serif))
            
            // multiline text alignment
            Text("멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. ")
                .multilineTextAlignment(.leading)
                .foregroundColor(.red)
        }
    }
}

struct TextBasic_Previews: PreviewProvider {
    static var previews: some View {
        TextBasic()
    }
}
