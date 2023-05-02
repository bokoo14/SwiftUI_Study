//
//  ContentView.swift
//  NearbyInteractionEX
//
//  Created by Bokyung on 2023/05/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
