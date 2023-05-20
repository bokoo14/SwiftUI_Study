//
//  ImageBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/09.
//

import SwiftUI

struct ImageBasic: View {
    var body: some View {
        VStack (spacing: 20) {
            Image("Luna")
                .resizable()
                .scaledToFill() // to scale this view to fill its parent, while maintaining the view’s aspect ratio as the view scales:
                .background(.teal)
                .border(.red)
                .frame(width: 300, height: 300)
                .cornerRadius(150)
            
            Divider()
            
            Image("Luna")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .background(.mint)
                .clipShape(Circle()) // 원형모양으로 이미지를 자름
        }
        
    }
}

struct ImageBasic_Previews: PreviewProvider {
    static var previews: some View {
        ImageBasic()
    }
}
