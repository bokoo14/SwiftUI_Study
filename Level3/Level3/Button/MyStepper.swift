//
//  MyStepper.swift
//  Level3
//
//  Created by Bokyung on 2023/03/26.
//

import SwiftUI

struct MyStepper: View {
    // stepper: 값을 증가, 감소시킬 수 있음
    @State var myLevel: Int = 1
    
    @State private var value = 0
    let colors: [Color] = [.orange, .red, .gray, .blue,
                           .green, .purple, .pink]
    
    func incrementStep() {
        value += 1
        if value >= colors.count { value = 0 }
    }
    
    func decrementStep() {
        value -= 1
        if value < 0 { value = colors.count - 1 }
    }
    
    var body: some View {
        //        Stepper(value: $myLevel, in: 1...10) {
        //            Text("level: \(myLevel)")
        //        }
        //        .padding()
        //        .colorMultiply(.purple)
        
        Stepper {
            Text("Value: \(value) Color: \(colors[value].description)")
        } onIncrement: { // stepper의 값이 증가할 때
            incrementStep()
        } onDecrement: { // stepper의 값이 감소할 때
            decrementStep()
        }
        .padding(5)
        .colorMultiply(colors[value])
    }
}

struct MyStepper_Previews: PreviewProvider {
    static var previews: some View {
        MyStepper()
    }
}
