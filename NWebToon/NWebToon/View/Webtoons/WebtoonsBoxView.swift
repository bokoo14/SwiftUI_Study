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
                .padding(.bottom, 5)
                //.frame(height: 152)
            //Spacer()
            Text(imageTitle)
                .font(.system(size: 13))
                .foregroundColor(Color("FontBlack"))
                .padding(.bottom, 4)
                .lineLimit(1)
            
            Text(imageDetail)
                .font(.system(size: 10))
                .foregroundColor(Color("FontGray100"))
            
        }
        //.frame(width: 117, height: 189)
        //.border(.red)
        
    }
}

struct WebtoonsBoxView_Previews: PreviewProvider {
    static var previews: some View {
        WebtoonsBoxView(imageName: "ImgContentMon01", imageTitle: "그냥 선생님", imageDetail: "엠케이 ★9.99")
    }
}
