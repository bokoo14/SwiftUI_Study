//
//  NewBuyView.swift
//  AppleStores
//
//  Created by Bokyung on 2023/06/15.
//

import SwiftUI

struct NewBuyView: View {
    var body: some View {
        HStack (spacing: 0){
            Text("₩1,250,000부터")
                .font(.system(size: 10, weight: .regular))
                //.border(.red)
                .padding(EdgeInsets(top: 28, leading: 20, bottom: 27, trailing: 0))
                //.border(.red)
            
            Spacer()
            
            Button {
                // action
            } label: {
                Text("구입하기")
                    .font(.system(size: 13, weight: .medium))
                    //.border(.red)
                    .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                    //.border(.red)
            }
            .background(Color("ColorButtonGray"))
            .cornerRadius(17)
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 19, trailing: 20))
            //.border(.red)

        }
        .frame(height: 67)
        .frame(maxWidth: .infinity)
        .background(Color("ColorBackLightBlue"))
        //.border(.red)
    }
}

struct NewBuyView_Previews: PreviewProvider {
    static var previews: some View {
        NewBuyView()
    }
}
