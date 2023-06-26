//
//  ProductAreaView.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/06/25.
//

import SwiftUI

struct ProductAreaView: View {
    var body: some View {
        VStack{
            LearnMoreView()
            
            PurchaseView()
            
            FooterView()
        }
       
    }
}

struct ProductAreaView_Previews: PreviewProvider {
    static var previews: some View {
        ProductAreaView()
    }
}
