//
//  DView.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/07/02.
//

import SwiftUI

struct DView: View {
    @Binding var DHeight : CGFloat
    var body: some View {
        VStack(spacing: 0){
            Image("ImgD")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            Image("ImgDd2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .background (
                    //전체 뷰 높이값
                    GeometryReader { geo -> Color in
                        DispatchQueue.main.async {
                            DHeight = geo.size.height
                        }
                        return Color.clear
                    }
                )
        }
    }
}

//struct DView_Previews: PreviewProvider {
//    static var previews: some View {
//        DView(DHeight: 30)
//    }
//}
