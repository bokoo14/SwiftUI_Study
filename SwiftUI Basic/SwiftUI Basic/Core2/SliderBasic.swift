//
//  SliderBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/23.
//

import SwiftUI

struct SliderBasic: View {
    // property
    @State var sliderValue: Double = 3
    @State var color: Color = .blue
    
    var body: some View {
        VStack{
            HStack{
                Text("level: ")
                Text("\(sliderValue)")
                // 소수점 1째자리까지만 나타내기
                Text(String(format: "%.1f", sliderValue))
            } // : HStack
            .foregroundColor(color)
            
            
            // Slider
            // value: 항상 float(double). int가 아닌 float타입으로 설정
            // in: 슬라이더의 범위 설정
            // step: 단계 설정 슬라이더가 어떤 단위로 증가, 감소되는지 설정
            // onEditingChanged: 슬라이더 value가 변경이 되면 처리할 이벤트
            Slider(value: $sliderValue, in: 1...5, step: 1.0) {
                Text("라벨")
            } minimumValueLabel: {
                Text("1")
            } maximumValueLabel: {
                Text("5")
            } onEditingChanged: { _ in
                color = .red
            } // : Slider
            .tint(.red)
            .padding()

        }
    }
}

struct SliderBasic_Previews: PreviewProvider {
    static var previews: some View {
        SliderBasic()
    }
}
