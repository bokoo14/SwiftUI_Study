//
//  SettingsHelpView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/05.
//

import SwiftUI

struct SettingsHelpView: View {
    // MARK: data를 따로 관리가 필요할거 같음 ... 
    @State var text1: String = "Q. ID와 비밀번호에 어떤 정보를 입력하나요?"
    @State var text2: String = "A. 아카데미 입소 시점에 부여 받은 pos.idserve.net 이메일 계정의 ID 부분을 ID란에, Learner Code를 비밀번호란에 입력해주세요."
    @State var text3: String = "Q. 출쓱용 기기를 변경해도 되나요?"
    @State var text4: String = " A. 출쓱용 기기가 아닌 기기로 이용이 불가능합니다. 기존에 등록된 기기에서 변경이 필요할 때는 담당 멘토에게 등록 기기 리셋을 요청해주세요."
    @State var text5: String = "Q. Learner Code가 기억이 안나요!"
    @State var text6: String = "A. Learner Code를 잊은 경우, Ops 팀 혹은 담당 멘토에게 정보 확인을 요청해주세요. 단, Learner Code 확인시에 별도의 본인 여부 확인 절차가 있을 수 있습니다."
    
    var body: some View {
        VStack (alignment: .leading){
            SettingsHelpTextView(question: $text1, answer: $text2)
            Spacer()
                .frame(height: 30)
            
            SettingsHelpTextView(question: $text3, answer: $text4)
            Spacer()
                .frame(height: 30)
            SettingsHelpTextView(question: $text5, answer: $text6)
            Spacer()
                .navigationTitle("도움이 필요하신가요?")
                .navigationBarTitleDisplayMode(.inline)
        }.padding(25)
        
    }
}

struct SettingsHelpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsHelpView()
        }
    }
}
