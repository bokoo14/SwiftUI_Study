////
////  SelectMyGroup.swift
////  FirebaseTest
////
////  Created by Bokyung on 2023/07/13.
////
//
//import SwiftUI
//import FirebaseCore
//import FirebaseFirestore
//
//struct SelectMyGroupView: View {
//    // firebase의 data
//    @State var documents: [QueryDocumentSnapshot] = []
//
//    @State var myGroup: Int = 1
//    @State var result: [[String: Any]]
//
//    var body: some View {
//        VStack(spacing: 0) {
//            Text("내가 원하는 그룹을 보여주기(1~4)❤️")
//            Picker(selection: $myGroup) {
//                ForEach(1..<5) { index in
//                    Text("\(index)")
//                }
//            } label: {
//                Text("나의 그룹 선택하기")
//            }
//
//            // 선택된 그룹만 보기
//            Button("선택된 그룹의 정보 보기 (1~4중 택 1)") {
//                fetchAllDocuments()
//                result = showMyGroup(data: documents, groupNumber: myGroup)
//            }
//
//
//            List(documents, id: \.documentID) { document in
//                let documentID = document.documentID
//                let data = document.data()
//                Text("Document ID: \(documentID), Data: \(convertDataToString(data: data))")
//            } // List
//
//        } // VStack
//    }
//
//
//    func fetchAllDocuments() {
//        firebaseDB.collection("users").getDocuments { snapshot, error in
//            if let error = error {
//                print("Error fetching documents: \(error)")
//                return
//            }
//
//            guard let documents = snapshot?.documents else {
//                print("No documents")
//                return
//            }
//
//            self.documents = documents
//        }
//    } // fetchAllDocuments
//
//    // data를 string으로 바꿔줌
//    func convertDataToString(data: [String: Any]) -> String {
//        var result = ""
//        for (key, value) in data {
//            let valueString = "\(value)"
//            result += "\(key): \(valueString), "
//        }
//        if result.hasSuffix(", ") {
//            result = String(result.dropLast(2))
//        }
//        return result
//    }
//
//    // 원하는 그룹만 select해줌
//    func showMyGroup(data: [QueryDocumentSnapshot], groupNumber: Int) -> [[String: Any]] {
//        var result: [[String: Any]] = [[:]]
//
//        for (key, value) in data {
//            if (key == "group" && value == groupNumber) {
//                result.append([key: value])
//            }
//        }
//        return result
//    }
//
//
//}
//
//struct SelectMyGroupView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectMyGroupView(result: [["sdfs" : "asasdasd"]])
//    }
//}
