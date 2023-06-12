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
                Color("backgroundColor").ignoresSafeArea()
                VStack(spacing: 0) {
                    HeaderView()
                        //.border(.blue)
                    
                    FightingView(nickname: $nickname)
                        //.border(.blue)
                    
                    // onTap -> front or back View를 띄워줘야 함
                    FlashCardView(front: {CardFrontView()}, back: {CardBackView()})
                        //.border(.blue)
                    
                    MainButtonComponent()
                        //.border(.blue)
                }
                .padding(.horizontal, 20)
            } // ZStack
            
        } // NavigationView
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
