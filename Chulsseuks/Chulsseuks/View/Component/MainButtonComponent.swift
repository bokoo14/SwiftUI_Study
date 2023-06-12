//
//  MainButtonComponent.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/05.
//

import SwiftUI

struct MainButtonComponent: View {
    var body: some View {
        Button(MainButtonString().mainBtn) {
            //action
            //MARK: 여러가지 버튼으로 만들어보기, 아는 버튼만 쓰지 말고 여러개 시도해보기
        }
        .font(.system(size: 22, weight: .bold))
        .frame(maxWidth: UIScreen.main.bounds.size.width,
               maxHeight: UIScreen.main.bounds.size.height*0.12)
        .background(Color.buttonColor)
        .foregroundColor(.white)
        .cornerRadius(50)
        .padding(.top, 20)
    }
    
}

struct MainButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        MainButtonComponent()
    }
}
