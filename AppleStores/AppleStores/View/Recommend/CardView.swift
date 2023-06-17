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
            .frame(height: 509) // 왜 상하에 검정 배경이 들어갈까
            .frame(maxWidth: UIScreen.main.bounds.width * 0.85)
            .overlay {
                ZStack{
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    VStack (spacing: 0){
                        Text(title)
                            .font(.system(size: 24, weight: .semibold))
                            .border(.orange)
                            .padding(EdgeInsets(top: 24, leading: 20, bottom: 8, trailing: 142))
                            .foregroundColor(Color("ColorFontBlack"))
                            .border(.orange)
                        
                        Text(explain)
                            .font(.system(size: 14, weight: .light))
                            .border(.orange)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 200))
                            .foregroundColor(Color("ColorFontBlack"))
                            .border(.orange)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .border(.blue)
                }
            }
            //.border(.red)
            
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
