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
    
    var body: some View {
        VStack {
            Divider()
            TabView {
                            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            Divider()
        } // VStack
        .border(.red)
    }
}

struct SwipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeTabView()
    }
}
