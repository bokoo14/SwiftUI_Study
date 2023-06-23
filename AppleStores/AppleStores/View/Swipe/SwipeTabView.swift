//
//  SwipeTabView.swift
//  AppleStores
//
//  Created by Bokyung on 2023/06/13.
//

import SwiftUI

struct SwipeTabView: View {
    // ViewModel을 초기화할 떄는 @StateObject로 불러오기
    @StateObject var swipeViewModel: SwipeViewModel = SwipeViewModel()
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = .gray
    }
    
    var body: some View {
        VStack{
            Divider()
            TabView {
                ForEach(swipeViewModel.swipePro){ sp in
                    // 모델 자체를 넘겨서 사용하는 편이 깔끔할 수 있을 것 같아요~
                    SwipePromotionView(imageName: sp.imageName, iConSize: sp.iconSize, title: sp.title, explain: sp.explain, viewMore: sp.viewMore)
                }
            
            } // TabView
            Divider()
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .never))
        .frame(height: 138)
        .frame(maxWidth: .infinity)
        //.border(.brown)
    }
}

struct SwipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeTabView()
    }
}
