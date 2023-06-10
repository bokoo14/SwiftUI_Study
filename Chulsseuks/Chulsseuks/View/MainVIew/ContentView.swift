//
//  ContentView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/01.
//

import SwiftUI

struct ContentView: View {
    @State var nickname: String = "Luna"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor.ignoresSafeArea()
                VStack {
                    HeaderView()
                    
                    FightingView(nickname: $nickname)
                    
                    // onTap -> front or back View를 띄워줘야 함
                    FlashCardView(front: {CardFrontView()}, back: {CardBackView()})
                    
                    MainButtonComponent()
                }
                .padding()
            } // ZStack
            
        } // NavigationView
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
