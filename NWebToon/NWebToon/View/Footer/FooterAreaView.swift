//
//  FooterAreaView.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/15.
//

import SwiftUI

struct FooterAreaView: View {
    var body: some View {
        VStack (spacing: 0){
            Image("ImgFooter1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            Divider()
            Image("ImgFooter2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
        } // VStack
    }
}

struct FooterAreaView_Previews: PreviewProvider {
    static var previews: some View {
        FooterAreaView()
    }
}
