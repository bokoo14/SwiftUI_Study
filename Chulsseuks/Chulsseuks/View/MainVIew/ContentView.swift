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
        NavigationView{
            ZStack{
                Color.backgroundColor.ignoresSafeArea()
                VStack {
                    // 1. 상단의 달력, 설정 뷰
                    HStack{
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
                    
                    TodayCheckView()
                    
                    Button("출쓱하기") {
                        //action
                    }
                    .font(.system(size: 22, weight: .bold))
                    .frame(maxWidth: UIScreen.main.bounds.size.width,
                           maxHeight: UIScreen.main.bounds.size.height*0.12)
                    .background(Color.buttonColor)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                    .padding(20)
                }
                .padding()
            } // ZStack
        }// NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
