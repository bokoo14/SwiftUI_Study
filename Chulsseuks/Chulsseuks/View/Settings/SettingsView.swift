//
//  SettingsView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/03.
//

import SwiftUI

struct SettingsView: View {
    @State var nickname: String = "Luna"
    @State var id: String = "bokoo"
    
    var body: some View {
     
            List {
                // Section1
                Section {
                    HStack {
                        Text("닉네임")
                        Spacer()
                        Text(nickname)
                    }
                    
                    HStack {
                        Text("ID")
                        Spacer()
                        Text(id)
                    }
                }
                
                // Section2
                Section {
                    NavigationLink {
                        // destination
                        SettingsHelpView()
                    } label: {
                        Text("도움이 필요하신가요?")
                    }
                    
                    NavigationLink {
                        // destination
                        SettingsPrivateView()
                    } label: {
                        Text("약관 및 개인정보 처리방침")
                    }
                    
                    NavigationLink {
                        // destination
                        SettingsPeopleView()
                    } label: {
                        Text("출쓱을 만든 사람")
                    }
                }
                
                // Section3
                Section{
                    Button {
                        // action
                    } label: {
                        Text("로그아웃")
                            .foregroundColor(.red)
                    }
                    
                }
                
            } //: List
            .navigationTitle("설정")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
