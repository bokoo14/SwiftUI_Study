//
//  ContentView.swift
//  AppleStores
//
//  Created by Bokyung on 2023/06/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 0){
            SwipeTabView()
        }
        .border(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
