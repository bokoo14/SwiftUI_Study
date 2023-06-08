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
    
    // 클로저 -> return값이 Front, Back
    var front: () -> Front
    var back: () -> Back
    
    @State var flipped: Bool = false
    @State var flashcardRotation = 0.0 // 플래시 카드 뷰 전체의 회전을 제어
    @State var contentRotation = 0.0 // 플래시 카드 내용의 회전을 제어
    
    var body: some View {
        ZStack{
            if flipped {
                back()
            }
            else  {
                front()
            }
        } //: ZStack
        // card를 y축으로 3D로 돌리는 effect
        .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
        .frame(height: 463)
        .frame(maxWidth: .infinity)
        
    }
    
    // function
    func flipFlashedCard() {
        
    }
    
    func flipBackFlashedCard() {
        
    }
    
}

// 카드의 앞면 View
struct CardFrontView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(25)
                .foregroundColor(.white)
                .shadow(radius: 15)
            VStack (alignment: .center){
                Spacer()
                
                Image("character")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                
                Spacer()
                Text("아래 버튼을 눌러 \n 오늘의 출쓱을 진행해주세요.")
                    .multilineTextAlignment(.center)
                    .fontWeight(.light)
                    .font(.system(size: 20))
                    .lineSpacing(5)
                
                Text("출석 규정 보러가기 >")
                    .foregroundColor(Color.TextColor)
                    .font(.system(size: 15))
                    .fontWeight(.light)
                    .padding(.top, 5)
                    .padding(.bottom, 30)
            }
        }
    }
}


// 카드의 뒷면 View
struct CardBackView: View {
    @Environment(\.colorScheme) var colorMode
    
    var body: some View {
        ZStack{
            switch colorMode {
            case .light:
                Rectangle()
                    .cornerRadius(25)
                    .foregroundColor(.white)
                    .shadow(radius: 15)
            case .dark:
                Rectangle()
                    .cornerRadius(25)
                    .foregroundColor(Color.backgroundColor2)
                    .shadow(radius: 15)
            @unknown default:
                Text("default mode")
            }
            
            VStack (alignment: .center){
                HStack{
                    
                    Text("한눈에 보는 출석 규정")
                        .font(.system(size: 25, weight: .medium))
                    Spacer()
                }
                .padding(30)
                
                switch colorMode {
                case .light:
                    Image("regulationLight")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170, height: 300)
                case .dark:
                    Image("regulationDark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170, height: 300)
                @unknown default:
                    Text("default mode")
                }
                
                
                Spacer()
            }
        }
        .padding()
    }
}


struct FlashCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
