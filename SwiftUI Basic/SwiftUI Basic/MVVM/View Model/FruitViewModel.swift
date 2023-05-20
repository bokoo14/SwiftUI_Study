//
//  FruitViewModel.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/07.
//

import Foundation

// ViewModel은 Class로 선언해야 함
class FruitViewModel: ObservableObject {
    // property
    
    // published wrapper는 @State와 비슷하게 상태값을 선언, class안에서는 @Published를 사용한다는 점이 다름
    // @Published는 Fruit배열의 값이 View에서 변경이 되면 FruitModel에서 새로운 변경사항을 알아차려서 변경한다는 점입니다.
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        getFruit()
    }
    
    // fruit
    func getFruit() {
        // fruit의 각각의 값 선언
        let fruit1 = FruitModel(name: "딸기", count: 1)
        let fruit2 = FruitModel(name: "사과", count: 2)
        let fruit3 = FruitModel(name: "바나나", count: 80)
        
        // 3초 딜레이 후, fruitArray에 선언된 값을 집어넣기
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.isLoading = false
        }
    }
    
    // fruitArray에서 값을 삭제하는 logic
    func deleteFruit(index: IndexSet){
        fruitArray.remove(atOffsets: index)
    }
    
    
}
