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
//                users.forEach { user in
//                    firebaseDB.collection("users").addDocument(data: [
//                        "usrName": user.userName,
//                        "userID": user.userID,
//                        "gender": user.gender,
//                        "email": user.email,
//                        "group": user.group,
//                        "target": user.target
//                    ]) { err in
//                        if let err = err {
//                            print("Error adding document: \(err)")
//                        } else {
//                            print("Document added with ID")
//                        }
//                    }
//                } // forEach
                users.forEach { user in
                    // 나중에 UUID로 바꾸던지 하면 될듯?
                    firebaseDB.collection("users").document(user.userName).setData([
                        "userName": user.userName,
                        "userID": user.userID,
                        "gender": user.gender,
                        "email": user.email,
                        "group": user.group,
                        "target": user.target
                    ]) { err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            print("Document added with ID")
                        }
                    }
                } // forEach
            } label: {
                Text("사용자 데이터 Firebase 추가")
            } // button
        } // VStack
    }
}

struct MakeGroupView_Previews: PreviewProvider {
    static var previews: some View {
        MakeGroupView()
    }
}
