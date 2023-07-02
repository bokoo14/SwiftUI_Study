//
//  EView.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/07/02.
//

import SwiftUI

struct EView: View {
    @Binding var EHeight : CGFloat
    var body: some View {
        Image("ImgE")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .background (
                //전체 뷰 높이값
                GeometryReader { geo -> Color in
                    DispatchQueue.main.async {
                        EHeight = geo.size.height
                    }
                    return Color.clear
                }
            )
    }
}

//struct EView_Previews: PreviewProvider {
//    static var previews: some View {
//        EView()
//    }
//}
