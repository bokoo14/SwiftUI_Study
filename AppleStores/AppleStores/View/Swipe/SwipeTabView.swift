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
        //UIPageControl.appearance().
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = .gray
    }
    
    var body: some View {
        VStack{
            Divider()
            TabView {
                ForEach(swipeViewModel.swipePro){ sp in
                    SwipePromotionView(imageName: sp.imageName, iConSize: sp.iconSize, title: sp.title, explain: sp.explain, viewMore: sp.viewMore)
                }
            
            } // TabView
            Divider()
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .never))
        .frame(height: 138)
        .frame(maxWidth: .infinity)
        .border(.brown)
    }
}

struct SwipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeTabView()
    }
}
