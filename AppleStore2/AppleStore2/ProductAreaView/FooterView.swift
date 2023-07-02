//
//  FooterView.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/06/25.
//

import SwiftUI

struct FooterView: View {
    let footerText: String = "1. iPhone 14 Pro 및 iPhone 14 Pro Max는 IEC 규격 60529하의 IP68 (이 문구를 발견하고 톡방에 올리면, 엠선생님의 NearMe 무료 음료수 이용권 증정)"
    
    var body: some View {
            VStack (alignment: .center, spacing: 0){
                Button {
                    // action
                } label: {
                    HStack (spacing: 10){
                        Text("\(Image(systemName: "square.and.arrow.up"))")
                            .font(.system(size: 14))
                            //.border(.red)
                        
                        Text("공유하기")
                            .font(.system(size: 14))
                            .foregroundColor(Color("ColorBtnBlue"))
                            //.border(.red)
                    }
                    .padding(EdgeInsets(top: 11, leading: 25, bottom: 10, trailing: 25))
                    .background(.white)
                    .cornerRadius(10)
                    .border(.red)
                } // Button
                .padding(.bottom, 20)
                
                Text(footerText)
                    .font(.system(size: 10))
                    .foregroundColor(Color("ColorFontDarkGray"))
                    .padding(EdgeInsets(top: 60, leading: 10, bottom: 20, trailing: 10))
                    .frame(maxWidth: .infinity)
                    .border(.red)
            } // VStack
            .frame(maxWidth: .infinity)
            .background(.clear)
            .border(.red)
     
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
