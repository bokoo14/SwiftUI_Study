//
//  StepperBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/20.
//

import SwiftUI

struct StepperBasic: View {
    // property
    @State var stepperValue: Int = 0
    @State var widthChange: CGFloat = 0
    
    var body: some View {
        VStack {
            // 기본 Stepper
            Stepper("기본 Stepper: \(stepperValue)", value: $stepperValue)
                .padding()
            Divider()
            
            // Stepper를 통해 Rectangle의 크기를 조절하기
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 100 + widthChange, height: 100)
                
            Stepper("직사각형 너비 변화"){
                differentWidth(amount: 20)
            } onDecrement: {
                differentWidth(amount: -20)
            } // : Stepper
            
        } // :VStack
    } // body
    
    // function - increase or decrease widthChange
    func differentWidth(amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthChange += amount
        }
    }
}

struct StepperBasic_Previews: PreviewProvider {
    static var previews: some View {
        StepperBasic()
    }
}

