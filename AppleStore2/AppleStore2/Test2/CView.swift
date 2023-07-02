//
//  CView.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/07/02.
//

import SwiftUI

struct CView: View {
    var body: some View {
        Image("ImgC")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
    }
}

struct CView_Previews: PreviewProvider {
    static var previews: some View {
        CView()
    }
}
