//
//  MainView.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/06/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
 
        imageLayout(imageTitle: "ImgMain01", overlayAlignment: .top, leadingOffset: 0, topOffset: 70) {
            Text("iPhone 14 Pro")
                .foregroundColor(Color("ColorFontWhite"))
                .font(.system(size: 20))
                .border(.red)
               
            Text("프로 그 이상.")
                .foregroundColor(Color("ColorFontWhite"))
                .font(.system(size: 40, weight: .bold))
                .border(.red)
        }
        
       
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
