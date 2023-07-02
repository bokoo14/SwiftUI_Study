//
//  BView.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/07/02.
//

import SwiftUI

struct BView: View {
    var body: some View {
        Image("ImgB")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
    }
}

struct BView_Previews: PreviewProvider {
    static var previews: some View {
        BView()
    }
}
