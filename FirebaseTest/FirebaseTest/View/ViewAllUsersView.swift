//
//  ViewAllUsersView.swift
//  FirebaseTest
//
//  Created by Bokyung on 2023/07/12.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct ViewAllUsersView: View {
    @State var documents: [QueryDocumentSnapshot] = []
    
    var body: some View {
        VStack {
            Button("사용자 데이터 불러오기") {
                fetchAllDocuments()
            }
            
            List(documents, id: \.documentID) { document in
                let documentID = document.documentID
                let data = document.data()
                Text("Document ID: \(documentID), Data: \(convertDataToString(data: data))")
            } // List

        } // VStack
    }
    
    // firebase의 users에 저장되어 있는 모든 정보 불러오기
    func fetchAllDocuments() {
        firebaseDB.collection("users").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching documents: \(error)")
                return
            }
            
            guard let documents = snapshot?.documents else {
                print("No documents")
                return
            }
            
            self.documents = documents
        }
    } // fetchAllDocuments
    
    // data를 string으로 바꿔줌
    func convertDataToString(data: [String: Any]) -> String {
        var result = ""
        for (key, value) in data {
            let valueString = "\(value)"
            result += "\(key): \(valueString), "
        }
        if result.hasSuffix(", ") {
            result = String(result.dropLast(2))
        }
        return result
    }
    
    // 원하는 그룹만 select해줌
    func findGroup(data: [String: Any], groupNumber: Int) -> String {
        var result = ""
//        for (key, value) in data {
//            if (key == "group" && value as! Int == groupNumber) { }
//                let valueString = "\(value)"
//                result += "\(key): \(valueString), "
//
//        }
//        if result.hasSuffix(", ") {
//            result = String(result.dropLast(2))
//        }
        return result
    }
}

struct ViewAllUsersView_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllUsersView()
    }
}
