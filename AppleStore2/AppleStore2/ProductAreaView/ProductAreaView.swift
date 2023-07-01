//
//  ProductAreaView.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/06/25.
//

import SwiftUI

struct ProductAreaView: View {
    let geo: GeometryProxy
    var body: some View {
        ZStack {
            Color("ColorBgGray").ignoresSafeArea()
            ScrollView{
                VStack (spacing: 20){
                    
                    LearnMoreView()
                        .padding(.top, 20)
                    // padding을 쓰지 않고 하는 법은 모르겠다 ...
                    // TODO: 여기서 제일 위의 padding에 도달하면
                    
                    PurchaseView()
                    
                    FooterView()
                } // VStack
            } // ScrollView
        }
        
    }
}

//struct ProductAreaView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductAreaView(geo: GeometryProxy()
//    }
//}


struct ProductAreaView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
