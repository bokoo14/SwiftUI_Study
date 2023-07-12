//
//  ModifyUserView.swift
//  FirebaseTest
//
//  Created by Bokyung on 2023/07/12.
//

import SwiftUI

struct ModifyUserView: View {
    var body: some View {
        VStack {
            Text("사용자 정보를 변경하기")
            // 단일 문서를 만들거나 덮어쓰려면 다음 언어별 set() 메서드를 사용합니다.
            // Add a new document in collection "cities"
            //                firebaseDB.collection("user").document("R5Vbave5WZlo8D7PD0Os").setData([
            //                    "usrName": "Luna",
            //                    "userID": "1",
            //                    "gender": "female",
            //                    "email": "asdfssdf@naver.com",
            //                    "group": 1,
            //                    "sentHeart": "Heemoo"
            //                ]) { err in
            //                    if let err = err {
            //                        print("Error writing document: \(err)")
            //                    } else {
            //                        print("Document successfully written!")
            //                    }
            //                }
        }
        
    }
}

struct ModifyUserView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyUserView()
    }
}
