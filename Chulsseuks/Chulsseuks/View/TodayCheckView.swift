//
//  TodayCheckView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/01.
//

import SwiftUI

struct TodayCheckView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(25)
                .foregroundColor(Color(red: 77 / 255, green: 77 / 255, blue: 74 / 255))
            VStack (alignment: .center){
                Spacer()
                
                Image("character")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                
                Spacer()
                Text("아래 버튼을 눌러 \n 오늘의 출쓱을 진행해주세요.")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .fontWeight(.heavy)
                    
                Text("출석 규정 보러가기 >")
                    .foregroundColor(.indigo)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .padding()
                
            }
        }
        .padding()
        
        
    }
}

struct TodayCheckView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
