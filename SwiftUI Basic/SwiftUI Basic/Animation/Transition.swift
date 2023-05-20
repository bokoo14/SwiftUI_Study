//
//  Transition.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/04.
//
/**
 transition: 화면 전환 효과, animation과 비슷
 move: 단방향 이동 transition
 opacity: 투명도 조절 transition
 scale: 크기 조절 transition
 asymmetric: 비대칭 방향 이동 transition
 */

import SwiftUI

struct Transition: View {
    // property
    @State var showTransition: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button {
                    withAnimation(.easeOut) {
                        showTransition.toggle()
                    }
                } label: {
                    Text("Button")
                }
                Spacer()
            }
            
            if showTransition {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .opacity(showTransition ? 1.0 : 0.0)
                
                // 1번 move transition
                //.transition(.move(edge: .bottom))
                
                // 2번 opacity transition
                // .transition(.opacity)
                
                // 3번 scale transition
                    .transition(.scale)
                
                // 4번 asymmetric transition - 시작점 끝점을 custom (비대칭)
                    .transition(.asymmetric(
                        insertion: .move(edge: .leading), // 시작하는 위치
                        removal: .move(edge: .trailing))) // 끝나는 위치
                
            }
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct Transition_Previews: PreviewProvider {
    static var previews: some View {
        Transition()
    }
}
