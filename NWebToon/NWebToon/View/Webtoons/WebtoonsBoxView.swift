//
//  WebtoonsBoxView.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/23.
//

import SwiftUI

struct WebtoonsBoxView: View {
    var imageName: String
    var imageTitle: String
    var imageDetail: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            Text(imageTitle)
                .font(.system(size: 13))
                .foregroundColor(Color("FontBlack"))
            
            Text(imageDetail)
                .font(.system(size: 10))
                .foregroundColor(Color("FontGray100"))
            
        }
        
    }
}

struct WebtoonsBoxView_Previews: PreviewProvider {
    static var previews: some View {
        WebtoonsBoxView(imageName: "ImgContentMon01", imageTitle: "그냥 선생님", imageDetail: "엠케이 ★9.99")
    }
}
