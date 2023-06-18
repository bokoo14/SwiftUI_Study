//
//  RecommendViewModel.swift
//  AppleStores
//
//  Created by Bokyung on 2023/06/15.
//

import Foundation

// ViewModel은 class로 선언해야 함
class RecommendViewModel: ObservableObject {
    @Published var recommendViewModel: [RecommendModels] = []
    
    init() {
        getData()
    }
    
    func getData() {
        let recOne = RecommendModels(title: "다채롭게 만개한\n어버이날 선물.", explain: "쉽게 선물 쇼핑하기", imageName: "ImgSwipeProduct01", titleColor: "ColorFontBlack", explainColor: "ColorFontBlack")
        let recTwo = RecommendModels(title: "iPhone 14 Pro\n딥퍼플", explain: "몽환적인 색감, 색다른 경험.", imageName: "ImgSwipeProduct02", titleColor: "ColorFontWhite", explainColor: "ColorFontGray")
        let recThree = RecommendModels(title: "MacBook Pro 14\n및 16", explain: "이거 문구를 발견하고, 톡방에 메세지를\n먼저 보내는 사람은 페페의 선물이!", imageName: "ImgSwipeProduct03", titleColor: "ColorFontWhite", explainColor: "ColorFontGray")
        
        recommendViewModel.append(recOne)
        recommendViewModel.append(recTwo)
        recommendViewModel.append(recThree)
    }
}
