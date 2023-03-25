//
//  MyWrapUp2.swift
//  Level2
//
//  Created by Bokyung on 2023/03/25.
//

import SwiftUI

// Color (다크모드) [new]
// Divider
// sheet, modal
// Alert
// TabView
// onDisappear, OnAppear
// Progress View
// Text Field
// Secure Field
// Toggle
// NavigationView
// 같이 해보는 과제
// NavigationStack
// Label

struct MyWrapUp2: View {
    @State var userID: String = ""
    @State var userPassWord: String = ""
    @State var hasLoggedIn: Bool = false
    @State var hasShownPassword: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Label {
                    Text("ID")
                } icon: {
                    Image(systemName: "person.fill")
                }.frame(width: 100, alignment: .leading)
                TextField("Text Field", text: $userID)
            }
            
            Divider()
            
            HStack {
                Label {
                    Text("Password")
                } icon: {
                    Image(systemName: "lock.fill")
                }
                .frame(width: 100, alignment: .leading)
                
                if hasShownPassword { // hasShownPassword == true이면 TextField로 input
                    TextField("Text Field", text: $userPassWord)
                }
                else { // hasShownPassword == false이면 SecureField로 input
                    SecureField("Secure Field", text: $userPassWord)
                }
                Spacer()
                
                Toggle(isOn: $hasShownPassword) {
                }
            }
            
            Button {
                // 버튼을 눌렀을때 아이디가 bokyung이고, 비밀번호가 1234이면 바인딩 변수가 true로 바뀌개
                if userID == "Bokyung" && userPassWord == "1234" {
                    hasLoggedIn = true
                } else {
                    hasLoggedIn = false
                }
                
            } label: {
                Text("Sign in")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(15)
            }

            
        }
        .padding()
        .sheet(isPresented: $hasLoggedIn) {
            Text("Successed LogIn!")
        }
    }
}

struct MyWrapUp2_Previews: PreviewProvider {
    static var previews: some View {
        MyWrapUp2()
    }
}
