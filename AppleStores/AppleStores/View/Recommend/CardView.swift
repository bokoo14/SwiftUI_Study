//
//  CardView.swift
//  AppleStores
//
//  Created by Bokyung on 2023/06/15.
//

import SwiftUI

struct CardView: View {
    @StateObject var recommendViewModel: RecommendViewModel = RecommendViewModel()
    
    var body: some View {
        CardOneView(title: recommendViewModel.recommendViewModel[0].title, explain: recommendViewModel.recommendViewModel[0].explain, imageName: recommendViewModel.recommendViewModel[0].imageName)
    }
}

struct CardOneView: View {
    let title: String
    let explain: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 14)
            .frame(height: 509)
            .frame(maxWidth: UIScreen.main.bounds.width*0.85)
            .overlay {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .border(.red)
            
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
