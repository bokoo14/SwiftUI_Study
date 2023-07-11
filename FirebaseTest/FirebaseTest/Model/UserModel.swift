//
//  UserModel.swift
//  FirebaseTest
//
//  Created by Bokyung on 2023/07/11.
//

import Foundation

// 16명의 user에 대한 Data를 Model에 저장

//예시: 유저1
//    - userName :  “Luna”
//    - userID: 1
//    - gender : 여자/ female
//    - email : dsfasfd@naver.com
//    - group: 1
struct UserModel: Identifiable {
    var id: UUID = UUID()
    var userName: String
    var userID: Int
    var gender: String
    var email: String
    var group: Int
}



