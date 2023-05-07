//
//  Match.swift
//  NearbyInteractionEX
//
//  Created by Bokyung on 2023/05/06.
//

import SwiftUI

struct Match: View {
    @State var nickName: String
   
    
    var body: some View {
        ZStack {
            Text(nickName)
        }
    }
}

struct Match_Previews: PreviewProvider {
    static var previews: some View {
        Match(nickName: "Luna")
            .preferredColorScheme(.dark)
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
            )
    }
}
