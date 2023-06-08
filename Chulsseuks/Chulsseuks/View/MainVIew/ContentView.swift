//
//  ContentView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/01.
//

import SwiftUI

struct ContentView: View {
    @State var nickname: String = "Luna"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor.ignoresSafeArea()
                VStack {
                    // 1. 상단의 달력, 설정 뷰
                    HStack {
                        Spacer()
                        NavigationLink {
                            CalendarView()
                        } label: {
                            Image(systemName: "calendar")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25)
                                .padding(.trailing, 20)
                        }
                        
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gearshape")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25)
                        }
                        
                    }
                    .foregroundColor(.indigo)
                    .padding(.horizontal, 15)
                    
                    
                    // 2. 화이팅
                    HStack {
                        Text("월클 디벨로퍼 \(nickname).\n오늘도 화이팅하세요!")
                        //.foregroundColor(.white)
                            .font(.system(size: 20, weight: .regular))
                            .lineSpacing(5)
                        Spacer()
                    }
                    .padding()
                    
                    // 이 card를 flash card로 바꿔줘야 함 .. -> rotation3DEffect로 ..
                    // TodayCheckView()
                    
                    // onTap에 따라서 front가 나올지 back이 나올지 결정해야 함
                    FlashCardView(front: {CardFrontView()}, back: {CardBackView()})
                    
                    
                    MainButtonComponent()
                }
//                .padding()
            } // ZStack
        }// NavigationView
    }
}

//MARK: rotate effet - 3D로 돌려야 함... - Z축으로 돌려야 함


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
