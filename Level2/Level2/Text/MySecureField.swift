//
//  MySecureField.swift
//  Level2
//
//  Created by Bokyung on 2023/03/25.
//

import SwiftUI

struct MySecureField: View {
    // SecureField
    @State var myPassword: String = ""
    @State var isSecureMode: Bool = true
    var body: some View {
        
        VStack (alignment: .leading) {
            if isSecureMode {
                Text("enter your password")
                
                HStack {
                    SecureField("Password", text: $myPassword)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        isSecureMode.toggle()
                    } label: {
                        Image(systemName: "lock")
                    }
                }
            } else {
                Text("enter your id")
                HStack {
                    TextField("ID", text: $myPassword)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        isSecureMode.toggle()
                    } label: {
                        Image(systemName: "lock")
                    }
                }
            }
            
        }.padding()
        
    }
}

struct MySecureField_Previews: PreviewProvider {
    static var previews: some View {
        MySecureField()
    }
}
