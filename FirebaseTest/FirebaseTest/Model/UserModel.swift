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
    var target: String
}

var users: [UserModel] = [
    // Group1
    UserModel(userName: "Luna", userID: 1, gender: "female", email: "dsfasfd@naver.com", group: 1, target: ""),
    UserModel(userName: "Heemoo", userID: 2, gender: "female", email: "sdfsd@naver.com", group: 1, target: ""),
    UserModel(userName: "Puppy", userID: 3, gender: "male", email: "asdf@naver.com", group: 1, target: ""),
    UserModel(userName: "Kiwi", userID: 4, gender: "male", email: "qweq@naver.com", group: 1, target: ""),
    // Group2
    UserModel(userName: "Lunaa", userID: 5, gender: "female", email: "sdfsd@naver.com", group: 2, target: ""),
    UserModel(userName: "HeeHee", userID: 6, gender: "female", email: "qweqw@naver.com", group: 2, target: ""),
    UserModel(userName: "Ocean", userID: 7, gender: "male", email: "ghj@naver.com", group: 2, target: ""),
    UserModel(userName: "Goggins", userID: 8, gender: "male", email: "elrkps@naver.com", group: 2, target: ""),
    // Group3
    UserModel(userName: "LuLu", userID: 9, gender: "female", email: "sdlfks@naver.com", group: 3, target: ""),
    UserModel(userName: "Hee", userID: 10, gender: "female", email: "asla@naver.com", group: 3, target: ""),
    UserModel(userName: "Suheon", userID: 11, gender: "male", email: "qwleq@naver.com", group: 3, target: ""),
    UserModel(userName: "Hoon", userID: 12, gender: "male", email: "poask@naver.com", group: 3, target: ""),
    // Group4
    UserModel(userName: "Bokoo", userID: 13, gender: "female", email: "sdlal@naver.com", group: 4, target: ""),
    UserModel(userName: "Moo", userID: 14, gender: "female", email: "relds@naver.com", group: 4, target: ""),
    UserModel(userName: "SuuChoi", userID: 15, gender: "male", email: "sdlfxp@naver.com", group: 4, target: ""),
    UserModel(userName: "Yongs", userID: 16, gender: "male", email: "asldk@naver.com", group: 4, target: "")
]
