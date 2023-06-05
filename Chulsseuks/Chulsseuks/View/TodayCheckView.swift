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
        .padding()
        
    }
}


// 로테이션 3D 이펙트를 쓰면 됨
// 내부 문서를 보면 로테이션 3개가 있음 .. 그걸  쓰면 쉬움

struct TodayCheckView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
