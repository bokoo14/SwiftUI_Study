//
//  SwipePromotionView.swift
//  AppleStores
//
//  Created by Bokyung on 2023/06/13.
//

import SwiftUI

struct SwipePromotionView: View {
    // ViewModel을 초기화할 떄는 @StateObject로 불러오기
    @StateObject var swipeViewModel: SwipeViewModel = SwipeViewModel()
    
    var body: some View {
        HStack (spacing: 0) {
            VStack {
                Text("\(Image(systemName: swipeViewModel.swipePro[0].imageName))")
                    .font(.system(size: 36))
                    .border(.red)
            }
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 75, trailing: 12))
            .border(.red)
            
            VStack (alignment: .leading, spacing: 0) {
                Text(swipeViewModel.swipePro[0].title)
                    .font(.system(size: 13, weight: .medium))
                    .border(.green)
                Text(swipeViewModel.swipePro[0].explain)
                    .font(.system(size: 12, weight: .light))
                    .border(.green)
                Text(swipeViewModel.swipePro[0].viewMore)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Color("ColorFontBlue"))
                    .border(.green)
            }
            .frame(maxWidth: 274)
            .border(.green)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .border(.blue)
        
    }
}

struct SwipePromotionView_Previews: PreviewProvider {
    static var previews: some View {
        SwipePromotionView()
    }
}
