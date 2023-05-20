//
//  SwipeActionBasic.swift
//  iOS15
//
//  Created by Bokyung on 2023/04/29.
//

import SwiftUI

struct SwipeActionBasic: View {
    /**
     SwipeAction: 기본적으로 Swipe를 하게 되면 삭제가 됨. 이것을 개발자가 다른 logic으로 실행할 수 있게 custom할 수 있게 해줌
     */
    // property
    @State var fruits: [String] = [
        "사과", "오렌지", "바나나", "복숭아"
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0)
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button {
                            // action
                        } label: {
                            Text("SAVE")
                        }
                        .tint(.green)

                        Button {
                            // action
                        } label: {
                            Text("Delete")
                        }
                        .tint(.red)
                    } // swipeAction
                
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button {
                            // action
                        } label: {
                            Text("SHARE")
                        }
                        .tint(.yellow)
                    } // : swipeAction
            } // :ForEach
        } // :List
    }
}

struct SwipeActionBasic_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActionBasic()
    }
}
