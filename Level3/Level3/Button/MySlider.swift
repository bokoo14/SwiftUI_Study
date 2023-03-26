//
//  MySlider.swift
//  Level3
//
//  Created by Bokyung on 2023/03/26.
//

import SwiftUI

struct MySlider: View {
    // slider: 슬라이딩을 해서 값을 변하게 만듦
    @State var myPoint: Float = 0.0
    
    var body: some View {
        VStack {
            Text(myPoint.description)
            //            Slider(value: $myPoint) {
            //                Text("slider!")
            //            }
            
            Slider(value: $myPoint, in: 0...100, step: 1) {
                Text("My Slider")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("100")
            }.tint(.orange)
            
        }
    }
}

struct MySlider_Previews: PreviewProvider {
    static var previews: some View {
        MySlider()
    }
}
