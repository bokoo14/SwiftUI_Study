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
            
            //Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
