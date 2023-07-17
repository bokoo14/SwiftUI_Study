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
    @State var userInfo: [UserModel] = []

    var body: some View {
        VStack {
            Button("사용자 데이터 불러오기") {
                fetchAllDocuments()
            }
            
//            List(userInfo, id: \.self) { document in
//                Text("gender: \(document.gender), group: \(document.group), target: \(document.target), userName: \(document.userName)")
            //} // List

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
            
            self.userInfo = documents.map {
                return UserModel(userName: $0["userName"] as? String ?? "", gender: $0["gender"] as? String ?? "", group: $0["group"] as? Int ?? 0, mySignal: $0["mySignal"] as? String ?? "", isParticipate: $0["isParticipate"] as? Bool ?? false)
            }

            print(self.userInfo)
        }
    } // fetchAllDocuments
}

struct ViewAllUsersView_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllUsersView()
    }
}
