//
//  NewView.swift
//  AppleStores
//
//  Created by Bokyung on 2023/06/15.
//

import SwiftUI

struct iPhoneData {
    let imageName: String = "imageiPhone14"
    let fontColor: String = "ColorFontBlack"
    let productName: String = "iPhone 14"
    let productexplain: String = "iPhone 14 그리고 큼직한 사이즈의 iPhone 14 Plus. 획기적인 도약을 이뤄낸 배터리 성능. 프로급 카메라. 6가지 멋진 컬러."
}

struct iPadData {
    let imageName: String = "imageiPad"
    let fontColor: String = "ColorFontBlack"
    let productName: String = "iPad"
    let productexplain: String = "다양한 일상 작업에 맞는 완전히 새롭고, 컬러풀한 iPad. 새로운 iPad를 소개합니다."
}

struct NewView: View {
    
    var body: some View {
        let iPhoneData = iPhoneData()
        let iPadData = iPadData()
        
        VStack (spacing: 0){
            // iPhone14 new Product
            NewProductView(imageName: iPhoneData.imageName, fontColor: iPhoneData.fontColor, productName: iPhoneData.productName, productexplain: iPhoneData.productexplain)
            
            Spacer()
                .frame(height: 31)
            
            NewBuyView()
                //.border(.red)
            
            // iPad new Product
            NewProductView(imageName: iPadData.imageName, fontColor: iPadData.fontColor, productName: iPadData.productName, productexplain: iPadData.productexplain)
            
            Spacer()
                .frame(height: 33)
            
            NewBuyView()
                //.border(.red)
            
        }
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView()
    }
}
