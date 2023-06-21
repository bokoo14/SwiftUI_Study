//
//  ContentView.swift
//  AppleStores
//
//  Created by Bokyung on 2023/06/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            HeaderView()
                .padding(.horizontal, 20)
            
            SwipeTabView()
            
            NewView()
            
            RecommendView()
        }
        //.border(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
