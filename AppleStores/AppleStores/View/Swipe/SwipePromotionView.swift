//
//  SwipePromotionView.swift
//  AppleStores
//
//  Created by Bokyung on 2023/06/13.
//

import SwiftUI

struct SwipePromotionView: View {
    // 상위 뷰에서 Data를 받아와야 함
    var imageName: String
    var iConSize: Double
    var title: String
    var explain: String
    var viewMore: String
    
    var body: some View {
        HStack (spacing: 0) {
            VStack (spacing: 0) {
                Text("\(Image(systemName: imageName))")
                // font size: Double
                    .font(.system(size: iConSize))
                    .border(.red)
                Spacer()
            }
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 12))
            .border(.red)
            
            VStack (alignment: .leading, spacing: 0) {
                Text(title)
                    .font(.system(size: 13, weight: .medium))
                    .border(.green)
                
                Spacer().frame(height: 4)
                
                Text(explain)
                    .font(.system(size: 12, weight: .light))
                    .frame(maxWidth: .infinity, alignment : .leading)
                    .border(.green)
                    .padding(.trailing, 20)
                
                Spacer().frame(height: 4)
                
                Text(viewMore)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Color("ColorFontBlue"))
                    .border(.green)
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            .border(.green)
        } //HStack
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 138)
        .border(.blue)
    }
}

struct SwipePromotionView_Previews: PreviewProvider {
    static var previews: some View {
        SwipePromotionView(imageName: "shippingbox", iConSize: 36, title: "무료 배송", explain: "집으로 배송 받으세요. 아니면 Apple Store애서 재고 제품을 픽업하세요.", viewMore: "더 알아보기")
    }
}
