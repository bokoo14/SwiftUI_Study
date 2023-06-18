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
        
        ForEach(recommendViewModel.recommendViewModel) { rv in
            CardDetailView(title: rv.title, explain: rv.explain, imageName: rv.imageName, titleColor: rv.titleColor, explainColor: rv.explainColor)
        }
       
    }
}

struct CardDetailView: View {
    let title: String
    let explain: String
    let imageName: String
    let titleColor: String
    let explainColor: String
    
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
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 24, leading: 20, bottom: 8, trailing: 0))
                            .foregroundColor(Color(titleColor))
                            .border(.orange)
                        
                        Text(explain)
                            .font(.system(size: 14, weight: .light))
                            .border(.orange)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(explainColor))
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
