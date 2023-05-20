//
//  AnimalViewModel.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/25.
//

import SwiftUI

class AnimalViewModel: ObservableObject {
    // property
    @Published var animals: [Animal] = Bundle.main.decode("animals.json")
    @Published var coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    @Published var videos: [Video] = Bundle.main.decode("videos.json")
    
    // GalleryView
    // selected될때 값이 남아있도록 하기 위해
    @Published var selectedAnimal: String = "tiger"
    
    
    // GridLayout
    @Published var gridLayout: [GridItem] = [GridItem(.flexible())]
    @Published var gridColumn: Double = 4.0
    
    // 앱을 켜자마자 실행되는 함수
    init() {
        gridSwitch()
    }
    
    // func - change the grid layout
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumn))
    }
}
