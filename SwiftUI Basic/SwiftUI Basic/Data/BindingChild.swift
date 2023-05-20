//
//  BindingChild.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/04.
//

import SwiftUI

struct BindingChild: View {
    @State var buttonColor: Color = Color.blue
    @Binding var backgroundColor: Color
    @Binding var title: String
    
    var body: some View {
        Button {
            // action
            buttonColor = Color.pink
            backgroundColor = Color.orange
            title = "Binding Child View"
            
        } label: {
            Text("Child View이동")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(10)
        }

    }
}

struct BindingChild_Previews: PreviewProvider {
    static var previews: some View {
        BindingChild(backgroundColor: .constant(Color.orange), title: .constant("Binding Child"))
            .previewLayout(.sizeThatFits)
    }
}
