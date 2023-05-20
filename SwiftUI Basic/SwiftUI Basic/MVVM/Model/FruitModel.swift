//
//  FruitModel.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/07.
//

import Foundation

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}
