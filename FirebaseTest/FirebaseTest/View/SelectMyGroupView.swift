//
//  SelectMyGroup.swift
//  FirebaseTest
//
//  Created by Bokyung on 2023/07/13.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct SelectMyGroupView: View {
    // firebase의 data
    @State var myGroupData: [QueryDocumentSnapshot] = []
    
    @State var myGroup: Int = 1
    //@State var result: [[String: Any]]
    
    var body: some View {
        VStack(spacing: 0) {
            Text("내가 원하는 그룹을 보여주기(1~4)❤️")
            Picker(selection: $myGroup) {
                ForEach(1..<5) { index in
                    Text("\(index)")
                }
            } label: {
                Text("나의 그룹 선택하기")
            }
            
            // 선택된 그룹만 보기
            Button("선택된 그룹의 정보 보기 (1~4중 택 1)") {
                showMyGroup(myGroup: myGroup)
                print("선택 그룹\(myGroup) 보기")
                print("======================")
                print(myGroupData)
                
            }
            List(myGroupData, id: \.documentID) { document in
                let documentID = document.documentID
                let data = document.data()
                Text("Document ID: \(documentID), Data: \(convertDataToString(data: data))")
            } // List
            
            
            
            // List로 내가 속한 Group을 보여주기
            
        } // VStack
    }
    
    // 원하는 그룹만 listen
    // 컬렉션의 여러 문서에 리슨
    // 문서와 마찬가지로 get() 대신 onSnapshot()을 사용하여 쿼리 결과를 리슨할 수 있습니다. 이렇게 하면 쿼리 스냅샷이 만들어집니다. 예를 들어 주가 CA인 문서를 리슨하는 방법은 다음과 같습니다.
    func showMyGroup(myGroup: Int) -> [QueryDocumentSnapshot] {
        var result: [QueryDocumentSnapshot] = []
        firebaseDB.collection("users").whereField("group", isEqualTo: myGroup)
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                myGroupData = documents
                result = documents
//                let users = documents.map { $0["name"] as? String ?? "" }
//                print("Current cities in CA: \(users)")
//                completion(users)
            }
        return result
    } // showMyGroup
    
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

}

struct SelectMyGroupView_Previews: PreviewProvider {
    static var previews: some View {
        SelectMyGroupView()
    }
}
