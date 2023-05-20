//
//  Animation.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/04.
//

/*
 Animation: 시작, 싱태변화, 도착 3가지 단계로 어떠한 로직이 실행할때 Object의 동적인 움직임을 말함
 시작: View의 최초 상태
 상태변화: View가 최초상태에서 멈추는 진행과정 상태
 도착: View가 도달하려는 목표 지점이고, 도착하면 멈추는 상태
 */

import SwiftUI

struct Animation: View {
    // property
    @State var isAnimation: Bool = false
    
    // 2번 View
    let timing: Double = 2.0
    
    var body: some View {
        // 1번 View
        VStack {
            Button {
                // 버튼을 눌렀을 때 어떤 동작을 할 것 인가
                withAnimation(
                    .default
                        //.repeatCount(5)
                        //.repeatForever()
                        //.delay(1.0)
                ) { // 바뀔 State값
                    isAnimation.toggle()
                }
            } label: {
                Text("Button")
            }
            
            
            RoundedRectangle(cornerRadius: isAnimation ? 50 : 0)
                .fill(isAnimation ? Color.red : Color.green)
                .frame(width: isAnimation ? 100 : 300,
                       height: isAnimation ? 100 : 300)
                .rotationEffect(Angle(degrees: isAnimation ? 360 : 0))
                .offset(y: isAnimation ? 300 : 0)
            
            Spacer()
        }
        
        // 2번 View - Speed에 따른 animation
        VStack {
            Button {
                isAnimation.toggle()
            } label: {
                Text("2번 Button")
            }
            
            // linear animation: 처음부터 끝까지 속도가 일정
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimation ? 350 : 50, height: 100)
                .animation(.linear(duration: timing), value: isAnimation)
            
            // easeIn animation: 처음에 느렸다가 끝에 빨라지는 효과
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimation ? 350 : 50, height: 100)
                .animation(.easeIn(duration: timing), value: isAnimation)
            
            // easeOut animation: 처음에 빨랐다가 끝에 느려지는 효과
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimation ? 350 : 50, height: 100)
                .animation(.easeOut(duration: timing), value: isAnimation)
            
            // easeInOut animation: 처음과 끝에 느려지고, 중간 부분에 빨라지는 효과
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimation ? 350 : 50, height: 100)
                .animation(.easeInOut(duration: timing), value: isAnimation)
            
        }
        
        // 3번 View - spring animation
        VStack {
            Button {
                // response: 단일 진동을 완료하는 데 걸리는 시간
                // damping: 얼마나 빠르게 스프링이 정지하는 속도제어. 만약 0일때 영원히 멈추지 않음 (0 ~ 1.0)
                // blendDuration: 다른 애니메이션 간의 전환 같이 제어
                withAnimation(.spring(response: 0.5,
                                      dampingFraction: 0.5, // 0 ~ 1.0
                                      blendDuration: 0)) {
                    isAnimation.toggle()
                }
            } label: {
                Text("Spring Animation")
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width:  isAnimation ? 350 : 50, height: 100)
        }
        
        
    }
}

struct Animation_Previews: PreviewProvider {
    static var previews: some View {
        Animation()
    }
}
