//
//  MyGradient.swift
//  Level3
//
//  Created by Bokyung on 2023/03/28.
//

import SwiftUI

struct MyGradient: View {
    var body: some View {
        // gradient
        ZStack{
            // 선형 그라데이션
            //            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            //                .ignoresSafeArea()
            
            
            // text에 그라데이션 넣기
            //            Text("BoKoo")
            //                .background( LinearGradient(gradient: Gradient(colors: [Color.green, Color.brown]), startPoint: .topLeading, endPoint: .bottomTrailing))
            
            
            // 원형 그라데이션
            //            AngularGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center)
            //                .ignoresSafeArea()
            
            
            // 동그란 그라데이션
            EllipticalGradient(colors:[Color.blue, Color.green], center: .center, startRadiusFraction: 0.0, endRadiusFraction: 0.5)
                .ignoresSafeArea()
            
        }
    }
}

struct MyGradient_Previews: PreviewProvider {
    static var previews: some View {
        MyGradient()
    }
}
