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
                // action
                // 단일 문서를 만들거나 덮어쓰려면 다음 언어별 set() 메서드를 사용합니다.
                // Add a new document in collection "cities"
                print("button is clicked!")
                db.collection("cities").document("LA").setData([
                    "name": "Los Angeles",
                    "state": "CA",
                    "country": "USA"
                ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
            } label: {
                Text("하트 보내기")
            }

        }
    }
}

struct SendHeartView_Previews: PreviewProvider {
    static var previews: some View {
        SendHeartView()
    }
}
