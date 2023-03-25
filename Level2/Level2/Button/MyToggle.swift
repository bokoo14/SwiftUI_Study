//
//  MyToggle.swift
//  Level2
//
//  Created by Bokyung on 2023/03/25.
//

import SwiftUI

struct MyToggle: View {
    // toggle
    @State var isLightOn: Bool = false
    var body: some View {
        Toggle(isOn: $isLightOn) {
            if isLightOn {
                Text("Light On ->")
            } else {
                Text("Light Off ->")
            }
        }
        .toggleStyle(.switch)
        .tint(.blue)
        .padding(30)
        
    }
}

struct MyToggle_Previews: PreviewProvider {
    static var previews: some View {
        MyToggle()
    }
}
