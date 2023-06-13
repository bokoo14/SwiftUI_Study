//
//  SwipeViewModel.swift
//  AppleStores
//
//  Created by Bokyung on 2023/06/13.
//

import Foundation

// ViewModel은 Class로 선언해야 함
class SwipeViewModel: ObservableObject {
    @Published var swipePro: [SwipeModel] = []
    
    // ViewModel이 초기화될 때마다 실행될 함수
    init() {
        getData()
    }
    
    func getData() {
        let swipeOne = SwipeModel(imageName: "shippingbox", iconSize: 36, title: "무료 배송", explain: "집으로 배송 받으세요. 아니면 Apple Store애서 재고 제품을 픽업하세요.", viewMore: "더 알아보기")
        let swipeTwo = SwipeModel(imageName: "macbook.and.iphone", iconSize: 31, title: "Apple Trade In", explain: "iPhoen 8 이후 모델을 보상 판매하면 iPhone14 또는 iPhoe 14 Pro 구입 시 사용할 수 있는 ￦40,000 ~ ￦780,000원 상당의 크리딧이. ", viewMore: "더 알아보기")
        let swipeThree = SwipeModel(imageName: "airpodspro.chargingcase.wireless", iconSize: 31, title: "Airpod Pro", explain: "에어팟 프로를 잃어버렸습니다. 제발 제 에어팟 프로를 찾아주세요. 찾아주신 분에겐 ￦20,000 상당의 크레딧이. *", viewMore: "더 알아보기")
        
        self.swipePro.append(swipeOne)
        self.swipePro.append(swipeTwo)
        self.swipePro.append(swipeThree)
    }
}
