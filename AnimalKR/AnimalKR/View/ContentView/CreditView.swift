//
//  CreditView.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/25.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack{
            Text("""
Copyright @ bokyung
All right reserved
Created by SwiftUI with MVVM architecture
""") // Text를 멀티라인으로 넣고 싶다면 "를 3개쓰면 된다
            .font(.footnote) // 글씨 크기 조절
            .multilineTextAlignment(.center) // 글자 가운데 정렬
            .padding()
            .opacity(0.5)
        }
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
