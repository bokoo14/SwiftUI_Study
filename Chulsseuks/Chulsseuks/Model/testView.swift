//
//  testView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/12.
//

import SwiftUI

struct testView: View {
    var body: some View {
        VStack() {
            Text("Hello, World!")
            Text("Hello, World!")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .border(.red)
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
