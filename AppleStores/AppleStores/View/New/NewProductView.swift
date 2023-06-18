//
//  NewProductView.swift
//  AppleStores
//
//  Created by Bokyung on 2023/06/15.
//

import SwiftUI

struct NewProductView: View {
    var imageName: String
    var fontColor: String
    var productName: String
    var productexplain: String
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack (alignment: .leading, spacing: 0){
                Text("NEW")
                    //.border(.blue)
                    .font(.system(size: 10))
                    .foregroundColor(Color(fontColor))
                    .padding(EdgeInsets(top: 24, leading: 20, bottom: 0, trailing: 0))
                    //.border(.red)
                
                Text(productName)
                    //.border(.blue)
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundColor(Color(fontColor))
                    .padding(EdgeInsets(top: 2, leading: 20, bottom: 0, trailing: 0))
                    //.border(.red)
                
                Text(productexplain)
                    //.border(.blue)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(Color(fontColor))
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 0, trailing: 34))
                    .lineSpacing(3)
                    //.border(.red)
                
                Spacer()
            }
        }
        .frame(height: 574)
        //.border(.red)
    }
}

struct NewProductView_Previews: PreviewProvider {
    static var previews: some View {
        NewProductView(imageName: "imageiPhone14", fontColor: "ColorFontBlack", productName: "iPhone 14", productexplain: "iPhone 14 그리고 큼직한 사이즈의 iPhone 14 Plus. 획기적인 도약을 이뤄낸 배터리 성능. 프로급 카메라. 6가지 멋진 컬러.")
    }
}
