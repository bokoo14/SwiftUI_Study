//
//  PurchaseView.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/06/25.
//

import SwiftUI

struct PurchaseView: View {
    var body: some View {
        
        imageLayout2(imageTitle: "Item", overlayAlignment: .top, leadingOffset: 0, topOffset: 60) {
            VStack (spacing: 0){
                Text("iPhone 14 Pro")
                    .font(.system(size: 26, weight: .bold))
                    .padding(.bottom, 345)
                
                Button {
                    // action
                } label: {
                    Text("구입하기")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 5, leading: 14, bottom: 3, trailing: 14))
                        .background(Color("ColorBtnBlue"))
                        .cornerRadius(20)
                }
                .padding(.bottom, 12)
                Text("₩ 1,550,000부터")
                    .font(.system(size: 10))
                    .padding(.bottom, 51)
                
            } // VStack
            .border(.red)
        } // imageLayout
        .frame(height: 538)
        .frame(maxWidth: .infinity)
        .border(.red)
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
    }
}
