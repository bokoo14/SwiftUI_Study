//
//  ProductAreaView.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/06/25.
//

import SwiftUI

struct ProductAreaView: View {
    
    @Binding var learnMoreViewHeight : CGFloat
    var body: some View {
        ZStack {
            Color("ColorBgGray").ignoresSafeArea()
            ScrollView{
                VStack (spacing: 20){
                    LearnMoreView()
                        .background (
                            //전체 뷰 높이값
                            GeometryReader { geo -> Color in
                                DispatchQueue.main.async {
                                    learnMoreViewHeight = geo.size.height
                                }
                                return Color.clear
                            }
                        )
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


//struct ProductAreaView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(wholeViewHeight: 30)
//    }
//}
