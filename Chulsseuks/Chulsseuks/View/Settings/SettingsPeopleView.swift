//
//  SettingsPeopleView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/05.
//

import SwiftUI

struct SettingsPeopleView: View {
    var body: some View {
        ScrollView {
            HStack{
                Image("character")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .padding(10)
                    .background(.yellow)
                    .clipShape(Circle()) // 이미지 둥글게 자르기
                Spacer()
                VStack (alignment: .leading){
                    Text("루나 / Luna")
                        .foregroundColor(.indigo)
                        .font(.system(size: 20))
                    Text("iOS Developer")
                        .foregroundColor(.gray)
                    Text("무한한 성장을 원하는 개발자")
                }
                Spacer()
            }// :HStack - 1명의 사람
            .frame(maxWidth: .infinity)
            
                .navigationTitle("출쓱을 만든 사람들")
                .navigationBarTitleDisplayMode(.inline)
        } //: ScrollView
        .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 30))
    }
    
        
}

struct SettingsPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsPeopleView()
        }
        
    }
}
