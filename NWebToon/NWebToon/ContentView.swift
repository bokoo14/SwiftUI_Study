//
//  ContentView.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ScrollView {
            HeaderView()
            WebtoonsTabView()
                //.frame(height: 850)
            ButtonAreaView()
            FooterAreaView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
