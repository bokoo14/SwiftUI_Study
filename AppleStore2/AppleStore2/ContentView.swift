//
//  ContentView.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/06/24.
//

import SwiftUI

struct ContentView: View {
    @State var isBottonNavigationOn: Bool = true
    
    var body: some View {
        ZStack{
            Color("ColorBgBlack").ignoresSafeArea()
            
            GeometryReader { geo in
                ScrollView{
                    VStack(spacing: 20) {
                        MainView()
                        DescribeView()
                        ProductAreaView(geo: geo)
                    } //VStack
                } // ScrollView
            } // GeometryReader
            
            if isBottonNavigationOn {
                BottonNavigation()
                    .position(x: 0, y: 0)
            }
        } // ZStack
    }
}

struct BottonNavigation: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .background(Color("ColorBgWhite"))
            .frame(width: 362, height: 68)
            .cornerRadius(16)
            .overlay {
                HStack {
                    Text("₩1,250,000부터")
                        .offset(x: 20, y: 0)
                    Spacer()
                    Button {
                        // action
                    } label: {
                        Text("구입하기")
                            .padding(EdgeInsets(top: 6, leading: 20, bottom: 6, trailing: 20))
                            .cornerRadius(17)
                    }
                    .offset(x: -20, y: 0)
                } // HStack
            } // overlay
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct BottonNavigation_Previews: PreviewProvider {
//    static var previews: some View {
//        BottonNavigation()
//    }
//}

