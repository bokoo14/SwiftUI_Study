//
//  MakeGroupView.swift
//  FirebaseTest
//
//  Created by Bokyung on 2023/07/07.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct MakeGroupView: View {
    
    var body: some View {
        VStack (spacing: 0){
            // 버튼을 누르면 user에 대한 Data를 "user"라는 Collections에 저장
            Button {
                // data 추가
                // Cloud Firestore는 컬렉션에 저장되는 문서에 데이터를 저장합니다. 문서에 데이터를 처음 추가할 때 Cloud Firestore에서 암시적으로 컬렉션과 문서를 만듭니다. 컬렉션이나 문서를 명시적으로 만들 필요가 없습니다.
                // 새 컬렉션과 문서를 만듦
                users.forEach { user in
                    firebaseDB.collection("users").addDocument(data: [
                        "usrName": "Puppy",
                        "userID": "2",
                        "gender": "male",
                        "email": "dfgsd@naver.com",
                        "group": 1,
                        "sentHeart": "Kiwi"
                    ]) { err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            print("Document added with ID")
                        }
                    }
                }

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
            } label: {
                Text("사용자 데이터 추가")
            } // button
            
        } // VStack
    }
}

struct SendHeartView_Previews: PreviewProvider {
    static var previews: some View {
        MakeGroupView()
    }
}
