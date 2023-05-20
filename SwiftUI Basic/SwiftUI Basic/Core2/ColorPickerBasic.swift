//
//  ColorPickerBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/11.
//

import SwiftUI

struct ColorPickerBasic: View {
    // property
    @State var backgroundColor: Color = .green
    var body: some View {
        ZStack{
            backgroundColor.ignoresSafeArea()
            
            ColorPicker(selection: $backgroundColor, supportsOpacity: true) {
                Text("Select your mood color")
            }
            .padding()
            .background(.black)
            .cornerRadius(10)
            .foregroundColor(.white)
            .font(.headline)
            .padding(50)
        } // :ZStack
    }
}

struct ColorPickerBasic_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerBasic()
    }
}
