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
    @State var isShow: Bool = false
    @State var documentID: String = ""
    @State var data: [String: Any] = ["": ""]
    var body: some View {
        VStack {
            // Cloud Firestore로 실시간 업데이트 가져오기
            // onSnapshot() 메서드로 문서를 리슨할 수 있습니다. 사용자가 제공하는 콜백이 최초로 호출될 때 단일 문서의 현재 콘텐츠로 문서 스냅샷이 즉시 생성됩니다. 그런 다음 콘텐츠가 변경될 때마다 콜백이 호출되어 문서 스냅샷을 업데이트합니다.
            Button {
                // action
                isShow.toggle()
            } label: {
                Text("사용자 데이터 불러오기")
            } // Button
            
            // isShow일때 사용자 데이터 List로 보여주기
            if isShow {
                
                
                Text("Document ID: \(documentID), Data: \(convertDataToString(data: data))")
                    .onAppear {
                        firebaseDB.collection("users")
                            .getDocuments { snapshot, error in
                                if let error = error {
                                    print("Error fetching documents: \(error)")
                                    return
                                }
                                
                                guard let documents = snapshot?.documents else {
                                    print("No documents")
                                    return
                                }
                                
                                for document in documents {
                                    documentID = document.documentID
                                    data = document.data()
                                    // 여기에서 각 문서에 대한 작업을 수행합니다.
                                    print("Document ID: \(documentID), Data: \(data)")
                                } // for
                            }
                    }
            } // if isShow
            else {
                EmptyView()
            }
        } // VStack
    }
    
    
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
}

struct ViewAllUsersView_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllUsersView(documentID: "1", data: ["key": "value"])
    }
}
