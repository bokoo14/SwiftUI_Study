//
//  SendHeartView.swift
//  FirebaseTest
//
//  Created by Bokyung on 2023/07/07.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct SendHeartView: View {
    let db = Firestore.firestore()
    var body: some View {
        VStack (spacing: 0){
            Button {
                // 단일 문서를 만들거나 덮어쓰려면 다음 언어별 set() 메서드를 사용합니다.
                // Add a new document in collection "cities"
                print("ADD ALL USER'S DATA!")
                db.collection("user").document("R5Vbave5WZlo8D7PD0Os").setData([
                    "usrName": "Luna",
                    "userID": "1",
                    "gender": "female",
                    "email": "dasdsasdf@naver.com",
                    "group": 1,
                    "sentHeart": "Puppy"
                ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
            } label: {
                Text("사용자 데이터 추가")
            } // button
            
        } // VStack
    }
}

struct SendHeartView_Previews: PreviewProvider {
    static var previews: some View {
        SendHeartView()
    }
}
