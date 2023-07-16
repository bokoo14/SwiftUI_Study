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
    var gender: String
    var group: Int
    var mySignal: String
    var isParticipate: Bool
    //var userID: String
    //var email: String
}

var users: [UserModel] = [
    // Group1
    UserModel(userName: "Luna",  gender: "female", group: 1, mySignal: "", isParticipate: false),
    UserModel(userName: "Heemoo",  gender: "female", group: 1, mySignal: "", isParticipate: false),
    UserModel(userName: "Puppy",  gender: "male", group: 1, mySignal: "", isParticipate: false),
    UserModel(userName: "Kiwi",  gender: "male", group: 1, mySignal: "", isParticipate: false)

    // Group2
//    UserModel(userName: "Lunaa", userID: "", gender: "female", email: "sdfsd@naver.com", group: 2, target: ""),
//    UserModel(userName: "HeeHee", userID: "", gender: "female", email: "qweqw@naver.com", group: 2, target: ""),
//    UserModel(userName: "Ocean", userID: "", gender: "male", email: "ghj@naver.com", group: 2, target: ""),
//    UserModel(userName: "Goggins", userID: "", gender: "male", email: "elrkps@naver.com", group: 2, target: ""),
//    // Group3
//    UserModel(userName: "LuLu", userID: "", gender: "female", email: "sdlfks@naver.com", group: 3, target: ""),
//    UserModel(userName: "Hee", userID: "", gender: "female", email: "asla@naver.com", group: 3, target: ""),
//    UserModel(userName: "Suheon", userID: "", gender: "male", email: "qwleq@naver.com", group: 3, target: ""),
//    UserModel(userName: "Hoon", userID: "", gender: "male", email: "poask@naver.com", group: 3, target: ""),
//    // Group4
//    UserModel(userName: "Bokoo", userID: "", gender: "female", email: "sdlal@naver.com", group: 4, target: ""),
//    UserModel(userName: "Moo", userID: "", gender: "female", email: "relds@naver.com", group: 4, target: ""),
//    UserModel(userName: "SuuChoi", userID: "", gender: "male", email: "sdlfxp@naver.com", group: 4, target: ""),
//    UserModel(userName: "Yongs", userID: "", gender: "male", email: "asldk@naver.com", group: 4, target: "")
]
