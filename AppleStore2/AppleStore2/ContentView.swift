//
//  ContentView.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color("ColorBgBlack").ignoresSafeArea()
            ScrollView{
                VStack(spacing: 20) {
                    MainView()
                    DescribeView()
                    ProductAreaView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
