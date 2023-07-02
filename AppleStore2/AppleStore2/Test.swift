//
//  Test.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/07/02.
//

import SwiftUI


struct ScrollOffsetPreferenceKey2: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    static func reduce(value: inout CGPoint, nextValue: ()-> CGPoint){} // 이건 여기서 안씀
}

struct Test: View {
    @State var scrollPosition: CGPoint = .zero
    
    @State var wholeViewHeight : CGFloat
    @State var CHeight : CGFloat
    
    @State var bottomBtnOffsetY : Double = 200
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView{
                VStack {
                    Image("ImgA")
                    Image("ImgB")
                    Image("ImgC")
                        .background (
                            //전체 뷰 높이값
                            GeometryReader { geo -> Color in
                                DispatchQueue.main.async {
                                    CHeight = geo.size.height
                                }
                                return Color.clear
                            }
                        )
                    Image("ImgD")
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
                            .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin)
                    })
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    self.scrollPosition = value
                    
                    if (scrollPosition.y - UIScreen.main.bounds.height) > -(wholeViewHeight - CHeight) {
                        
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5)) {
                            bottomBtnOffsetY = -70
                        }
                    } else {
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5)) {
                            bottomBtnOffsetY = 200
                        }
                    }
                }
                
            }
            BottonNavigation()
                .offset(x: 0, y: bottomBtnOffsetY)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5)) {
                    bottomBtnOffsetY = -70
                }
            }
        } // onAppear
    }
    
    struct BottonNavigation: View {
        var body: some View {
            Rectangle()
                .foregroundColor(.clear)
                .background(Color("ColorBgWhite"))
                .frame(width: 362, height: 68)
                .cornerRadius(16)
                .overlay {
                    HStack {
                        Text("₩1,250,000부터")
                            .offset(x: 20, y: 0)
                        Spacer()
                        Button {
                            // action
                        } label: {
                            Text("구입하기")
                                .padding(EdgeInsets(top: 6, leading: 20, bottom: 6, trailing: 20))
                                .cornerRadius(17)
                        }
                        .offset(x: -20, y: 0)
                    } // HStack
                } // overlay
        }
    }
}



struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test(wholeViewHeight: 30, CHeight: 30)
    }
}
