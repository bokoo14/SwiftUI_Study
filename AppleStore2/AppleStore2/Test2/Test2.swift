//
//  Test2.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/07/02.
//

import SwiftUI

struct ScrollOffsetPreferenceKey3: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    static func reduce(value: inout CGPoint, nextValue: ()-> CGPoint){} // 이건 여기서 안씀
}

struct Test2: View {
    @State var scrollPosition: CGPoint = .zero
    
    @State var wholeViewHeight : CGFloat
    @State var DHeight : CGFloat
    @State var EHeight : CGFloat
    
    
    @State var bottomBtnOffsetY : Double = 200
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 0){
                    AView()
                    BView()
                    CView()
                    DView(DHeight: $DHeight)
                    EView(EHeight: $EHeight)
                } // VStack
                .background (
                    //전체 뷰 높이값
                    GeometryReader { geo -> Color in
                        DispatchQueue.main.async {
                            wholeViewHeight = geo.size.height
                        }
                        return Color.clear
                    }
                )
                // ScrollOffsetPreferenceKey에 있는 key값에 value값을 넣어줌
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .preference(key: ScrollOffsetPreferenceKey3.self, value: geometry.frame(in: .named("scroll")).origin)
                    })
                .onPreferenceChange(ScrollOffsetPreferenceKey3.self) { value in
                    self.scrollPosition = value
                    
                    if (scrollPosition.y - UIScreen.main.bounds.height) > -(wholeViewHeight - (DHeight + EHeight)) {
                        
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5)) {
                            bottomBtnOffsetY = -70
                        }
                    } else {
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5)) {
                            bottomBtnOffsetY = 200
                        }
                    }
                }
            } // ScrollView
            BottonNavigation2()
                .offset(x: 0, y: bottomBtnOffsetY)
                .padding(.horizontal, 16)
        } // ZStack
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5)) {
                    bottomBtnOffsetY = -70
                }
            }
        } // onAppear
    }
}

struct Test2_Previews: PreviewProvider {
    static var previews: some View {
        Test2(wholeViewHeight: 30, DHeight: 30, EHeight: 30)
    }
}
