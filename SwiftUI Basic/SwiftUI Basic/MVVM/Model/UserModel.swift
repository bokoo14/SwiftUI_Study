//
//  UserModel.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/06.
//

import Foundation

struct UserModel: Identifiable {
    let id: String = UUID().uuidString // 사용자의 고유의 UUID값을 생성하고, string으로 변환
    let displayName: String
    let userName: String
    let followerCount: Int
    let isChecked: Bool
}
