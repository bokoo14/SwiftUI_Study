//
//  Match.swift
//  NearbyInteractionEX
//
//  Created by Bokyung on 2023/05/06.
//

import SwiftUI

struct Match: View {
    let imageData: UIImage?
    let nickName: String
    let keywords: [Int]
    
    @State var myKeywords : [Int] = []
    @State var commonKeywords : [Int] = []
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct Match_Previews: PreviewProvider {
    static var previews: some View {
        Match(imageData: nil, nickName: "빅썬", keywords: [1,45,31,30,0,14,15,46])
            .preferredColorScheme(.dark)
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
            )
    }
}
