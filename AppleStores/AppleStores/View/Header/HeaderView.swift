//
//  HeaderView.swift
//  AppleStores
//
//  Created by Bokyung on 2023/06/15.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("쇼핑하기")
                .font(.system(size: 30, weight: .semibold))
                .padding(EdgeInsets(top: 54, leading: 0, bottom: 10, trailing: 0))
                .border(.red)
            Spacer()
            Text("\(Image("imageLogo"))")
                .frame(width: 37, height: 36)
                .padding(EdgeInsets(top: 48, leading: 0, bottom: 16, trailing: 0))
                .border(.red)
        } // HStack
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .border(.red)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
