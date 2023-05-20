//
//  Sheet2.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/07.
//

import SwiftUI

struct Sheet2: View {
    // State의 값을 넘겨 주는 것을 binding이라 함
    
    // property
    @Environment(\.presentationMode) var presentaionMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red.ignoresSafeArea()
            
            Button {
                // sheet 닫기 action
                presentaionMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
            } // : Button

        } // :ZStacks
    }
}

struct Sheet2_Previews: PreviewProvider {
    static var previews: some View {
        Sheet2()
    }
}
