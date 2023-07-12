//
//  HeaderView.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/12.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        GeometryReader { geo in
            Image("ImgBanner01")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250)
                .overlay(alignment: .bottom) {
                    Image("ImgLineBanner01")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 41)
                }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
