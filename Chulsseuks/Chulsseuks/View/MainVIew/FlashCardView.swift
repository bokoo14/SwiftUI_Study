//
//  FlashCardView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/06.
//

import SwiftUI

// <Front, Back> - 제네릭: 전달되는 인자에 따라 동적으로 타입을 결정
// where: 제네릭 타입 제약을 추가. 다른 유형을 사용하지 않도록 강제
struct FlashCardView<Front, Back>: View  where Front: View, Back: View {
    
    // 클로저
    var front: () -> Front
    var back: () -> Back
    
    @State var flipped: Bool = false
    @State var flashcardRotation = 0.0
    @State var contentRotation = 0.0
    
    var body: some View {
        Text("Hello, World!")
    }
}


//struct FlashCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        FlashCardView()
//    }
//}
