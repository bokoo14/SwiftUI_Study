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
    @State var DHeight : CGFloat
    
    @State var bottomBtnOffsetY : Double = 200
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView{
                VStack(spacing: 0){
                    Image("ImgA")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                    Image("ImgB")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                    Image("ImgC")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
        
                    Image("ImgD")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .background (
                            //전체 뷰 높이값
                            GeometryReader { geo -> Color in
                                DispatchQueue.main.async {
                                    DHeight = geo.size.height
                                }
                                return Color.clear
                            }
                        )
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
                            .preference(key: ScrollOffsetPreferenceKey2.self, value: geometry.frame(in: .named("scroll")).origin)
                    })
                .onPreferenceChange(ScrollOffsetPreferenceKey2.self) { value in
                    self.scrollPosition = value
                    
                    if (scrollPosition.y - UIScreen.main.bounds.height) > -(wholeViewHeight - DHeight) {
                        
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
        }
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

struct BottonNavigation2: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .background(Color("ColorBgWhite"))
            .frame(maxWidth: .infinity)
            .frame(height: 68)
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



struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test(wholeViewHeight: 30, DHeight: 30)
    }
}
