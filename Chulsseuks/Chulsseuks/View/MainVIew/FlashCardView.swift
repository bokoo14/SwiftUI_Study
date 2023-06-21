//  FlashCardView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/06.
//

import SwiftUI

// <Front, Back> - 제네릭: 전달되는 인자에 따라 동적으로 타입을 결정
// where: 제네릭 타입 제약을 추가. 다른 유형을 사용하지 않도록 강제
struct FlashCardView<Front, Back>: View  where Front: View, Back: View {
    
    // 클로저 -> return값이 Front, Back
    var front: () -> Front
    var back: () -> Back
    
    @State var flipped: Bool = false
    @State var contentRotation = 0.0 // 플래시 카드 내용의 회전을 제어
    @State var flashcardRotation = 0.0 // 플래시 카드 뷰 전체의 회전을 제어
    
    var body: some View {
        ZStack{
            // flppped가 true이면 back View를 보여줌, false이면 front View를 보여줌
            if flipped {
                back()
            } else {
                front()
            }
        } //: ZStack
        // card를 y축으로 3D로 돌리는 effect
        .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0)) // 카드 내용을 제어
        .frame(height: 450)
        .frame(maxWidth: .infinity)
        .onTapGesture {
            flipped ? flipBackFlashedCard() : flipFlashedCard()
        }
        .rotation3DEffect(.degrees(flashcardRotation), axis: (x: 0, y: 1, z: 0), perspective: 0.2) // 플래시 카드 전체를 제어
    } // : body: View
    
    
    // func
    // 카드 View가 front일때 -> Card를 y축을 기준으로 시계 반대방향으로 회전
    func flipFlashedCard() {
        let animationTime: Double = 0.5
        // 카드 자체를 flip - duration: 0.5초
        withAnimation(Animation.linear(duration: animationTime)) {
            flashcardRotation -= 180 //
        }
        
        // 카드 내의 컴포넌트들을 flip - duration을 엄청 작게 만들어서 마지막의 rotation 효과만 보여주게 함
        // duration을 0.001로 한 이유: 원래는 1바퀴 돌고 마지막에 180도 돌면서 멈추는 구간이 느리게 보이는데, duration을 엄청 작게 주면 1바퀴 도는 부분이 잘 안보이게 됨
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
            contentRotation -= 180
            flipped.toggle()
        }
    }
    
    // 카드 View가 back일때 -> Card를 y축을 기준으로 시계방향으로 회전
    func flipBackFlashedCard() {
        let animationTime: Double = 0.5
        // 카드 자체를 flip - duration: 0.5초
        withAnimation(Animation.linear(duration: animationTime)) {
            flashcardRotation += 180 //
        }
        
        // 카드 내의 컴포넌트들을 flip - duration을 엄청 작게 만들어서 마지막의 rotation 효과만 보여주게 함
        // duration을 0.001로 한 이유: 원래는 1바퀴 돌고 마지막에 180도 돌면서 멈추는 구간이 느리게 보이는데, duration을 엄청 작게 주면 1바퀴 도는 부분이 잘 안보이게 됨
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
            contentRotation += 180
            flipped.toggle()
        }
    }
    
}

// 카드의 앞면 View
struct CardFrontView: View {
    var body: some View {
        Rectangle()
            .cornerRadius(25)
            .foregroundColor(Color("backgroundColor2"))
            .shadow(radius:10)
            .overlay {
                VStack (alignment: .center) {
                    Spacer()
                    
                    Image(CardFrontViewString().image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                    
                    Spacer()
                    Text(CardFrontViewString().text1)
                        .multilineTextAlignment(.center)
                        .fontWeight(.light)
                        .font(.system(size: 20))
                        .lineSpacing(5)
                    Text(CardFrontViewString().text2).foregroundColor(Color("textColor2"))
                        .font(.system(size: 15))
                        .fontWeight(.light)
                        .padding(.top, 5)
                        .padding(.bottom, 30)
                } //: VStack
            } //: overlay
    }
}


// 카드의 뒷면 View
struct CardBackView: View {
    @Environment(\.colorScheme) var colorMode
    
    var body: some View {
        
        Rectangle()
            .cornerRadius(25)
            .foregroundColor(Color("backgroundColor2"))
            .shadow(radius: 15)
            .overlay {
                VStack (alignment: .center){
                    HStack{
                        Text(CardBackViewString().text1)
                            .font(.system(size: 25, weight: .medium))
                            .foregroundColor(Color("textColor"))
                        Spacer()
                    }
                    .padding(30)
                    
                    Image(CardBackViewString().image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170, height: 300)
                    Spacer()
                }
            } //: overlay
    }
}


struct FlashCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
