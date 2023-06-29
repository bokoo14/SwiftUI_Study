//
//  LearnMoreView.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/06/25.
//

import SwiftUI

struct LearnMoreView: View {
    var body: some View {
        VStack (alignment: .center, spacing: 10){
            Text("iPhone 14 Pro 더 깊이 살펴보기")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(Color("ColorFontBlack"))
                .border(.red)
            Button {
                // action
            } label: {
                Text("apple.com에서 더 알아보기")
                    .font(.system(size: 12))
                    .foregroundColor(Color("ColorBtnBlue"))
                    .border(.red)
            }
        } // VStack
        .frame(maxWidth: .infinity)
        .padding(.vertical, 60)
        .background(.white)
        .border(.red)
    }
    
    
}

struct LearnMoreView_Previews: PreviewProvider {
    static var previews: some View {
        LearnMoreView()
    }
}
