//
//  AView.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/07/02.
//

import SwiftUI

struct AView: View {
    var body: some View {
        Image("ImgA")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
    }
}

struct AView_Previews: PreviewProvider {
    static var previews: some View {
        AView()
    }
}
