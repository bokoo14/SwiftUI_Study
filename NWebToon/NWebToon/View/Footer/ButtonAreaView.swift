//
//  ButtonAreaView.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/15.
//

import SwiftUI

struct ButtonAreaView: View {
    var body: some View {
        Image("ImgButtonArea")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
    }
}

struct ButtonAreaView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAreaView()
    }
}
