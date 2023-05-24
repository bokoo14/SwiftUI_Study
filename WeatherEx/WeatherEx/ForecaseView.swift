//
//  ForecaseView.swift
//  WeatherEx
//
//  Created by Bokyung on 2023/05/24.
//

import SwiftUI

struct ForecaseView: View {
    var time: String
    var imageName: String
    var celcius: CGFloat
    
    var body: some View {
        VStack {
            Text(time)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .font(.title3)
                .symbolVariant(.fill) // sfsymbol을 채워주기
                .symbolRenderingMode(.multicolor) // sfsymbold의 색상을 원래 색상으로
                .frame(height: 30)
            
            Text("\(Int(celcius))°")
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

struct ForecaseView_Previews: PreviewProvider {
    static var previews: some View {
        ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
            .background(.black)
    }
}
