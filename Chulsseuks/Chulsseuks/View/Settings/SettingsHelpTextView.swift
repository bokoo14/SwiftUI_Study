//
//  SettingsHelpTextView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/05.
//

import SwiftUI

struct SettingsHelpTextView: View {
    @Binding var question: String
    @Binding var answer: String
    
    var body: some View {
        VStack (alignment: .leading){
            Text(question)
                .foregroundColor(Color.ModalColor)
                .font(.system(.title3, weight: .semibold))
                .padding(1)
            Text(answer)
                .font(.system(.body))
                .lineSpacing(5)
        } 
    }
}

struct SettingsHelpTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsHelpTextView(question: .constant("Q. ID와 비밀번호에 어떤 정보를 입력하나요?"), answer: .constant("A. 아카데미 입소 시점에 부여 받은 pos.idserve.net 이메일 계정의 ID 부분을 ID란에, Learner Code를 비밀번호란에 입력해주세요."))
        }
        
    }
}
