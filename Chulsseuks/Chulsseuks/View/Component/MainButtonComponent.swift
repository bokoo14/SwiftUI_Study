//
//  MainButtonComponent.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/05.
//

import SwiftUI

struct MainButtonComponent: View {
    var body: some View {
        VStack{
            Button("출쓱하기") {
                //action
            }
            .font(.system(size: 22, weight: .bold))
            .frame(maxWidth: UIScreen.main.bounds.size.width,
                   maxHeight: UIScreen.main.bounds.size.height*0.12)
            .background(Color.buttonColor)
            .foregroundColor(.white)
            .cornerRadius(50)
            .padding(20)
        }
    }
}

struct MainButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        MainButtonComponent()
    }
}
