//
//  ContentView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/01.
//

import SwiftUI

struct ContentView: View {
    @State var nickname: String = "루나"
    
    var body: some View {
        ZStack{
            Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255).ignoresSafeArea()
            VStack {
                // 1. 상단의 달력, 설정 뷰
                HStack{
                    Spacer()
                    Image(systemName: "calendar")
                        .padding(.trailing, 20)
                    Image(systemName: "gearshape")
                }
                .foregroundColor(.indigo)
                .padding()
                
                // 2. 화이팅
                HStack {
                    Text("월클 디벨로퍼 \(nickname).\n오늘도 화이팅하세요!")
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                
                TodayCheckView()
                
                Button("출쓱하기") {
                    //action
                }
                .frame(maxWidth: UIScreen.main.bounds.size.width,
                       maxHeight: UIScreen.main.bounds.size.height*0.1)
                .background(.indigo)
                .foregroundColor(.white)
                .cornerRadius(40)
                .padding(20)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
