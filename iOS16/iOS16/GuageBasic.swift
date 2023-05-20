//
//  GuageBasic.swift
//  iOS16
//
//  Created by Bokyung on 2023/05/17.
//

import SwiftUI

struct GuageBasic: View {
    let gradient = Gradient(colors: [.green, .yellow, .orange, .red])
    @State var gaugeValue: Float = 0.2
    
    var body: some View {
        Gauge(value: gaugeValue) {
            Text("gaugeValue로 나타내기")
        } currentValueLabel: {
            Text("\(gaugeValue)")
        }
        .gaugeStyle(.accessoryLinear)
        .tint(gradient)
        .padding()
    }
}

struct GuageBasic_Previews: PreviewProvider {
    static var previews: some View {
        GuageBasic()
    }
}
