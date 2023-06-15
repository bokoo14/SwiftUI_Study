//
//  RecommendModels.swift
//  AppleStores
//
//  Created by Bokyung on 2023/06/15.
//

import Foundation

struct RecommendModels: Identifiable {
    var id: UUID = UUID()
    let title: String
    let explain: String
    let imageName: String
}
