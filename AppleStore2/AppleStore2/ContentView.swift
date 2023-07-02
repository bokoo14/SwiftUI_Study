//
//  ContentView.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/06/24.
//

import SwiftUI

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    static func reduce(value: inout CGPoint, nextValue: ()-> CGPoint){} // 이건 여기서 안씀
}

struct ContentView: View {
    @State var scrollPosition: CGPoint = .zero
    
    @State var wholeViewHeight : CGFloat
    @State var productAreaHeight : CGFloat
    @State var learnMoreViewHeight : CGFloat
    
    @State var bottomBtnOffsetY : Double = 200
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing : 20){
                    VStack(spacing: 20) {
                        MainView() //A
                        DescribeView() //B
                    }
                    .background(Color("ColorBgBlack"))
        
                    ProductAreaView(learnMoreViewHeight: $learnMoreViewHeight)
                        .background (
                            //전체 뷰 높이값
                            GeometryReader { geo -> Color in
                                DispatchQueue.main.async {
                                    productAreaHeight = geo.size.height
                                }
                                return Color.clear
                            }
                        )
                } // VStack
                .background(Color("ColorBgGray"))
                
                
                // background로 감싸고 geometry를 사용해서 전체 뷰의 값을 구함
                // background는 return값이 필요해서 Color.clear로 투명한 return값을 줌
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
                    
                    if (scrollPosition.y - UIScreen.main.bounds.height) > -(wholeViewHeight - (productAreaHeight - learnMoreViewHeight)) {
                        
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5)) {
                            bottomBtnOffsetY = -70
                        }
                    } else {
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5)) {
                            bottomBtnOffsetY = 200
                        }
                    }
                    //                    print(scrollPosition.y - UIScreen.main.bounds.height)
                    //                    print(wholeViewHeight)
                    
                    
                    //                    if (scrollPosition.y - UIScreen.main.bounds.height) > {
                    //                        print("hello")
                    //                    } else {
                    //                        print("bye")
                    //                    }
                    
                    
                } // onPreferenceChange
            }

            BottonNavigation()
                .offset(x: 0, y: bottomBtnOffsetY)
            
        } // GeometryReader
        .background() {
            VStack(spacing: .zero){
                Color(.black)
                Color("ColorBgGray")
            }
        }// ZStack
        .ignoresSafeArea()
        
        //view가 나타날때, isBottomBtnVisible 값을 true 처리 및 offset 값 -70으로 설정
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5)) {
                    bottomBtnOffsetY = -70
                }
            }
        } // onAppear
        
        
    }
    
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(wholeViewHeight: 30, productAreaHeight: 30, learnMoreViewHeight: 30)
    }
}

//struct BottonNavigation_Previews: PreviewProvider {
//    static var previews: some View {
//        BottonNavigation()
//    }
//}

