//
//  VideoListItem.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/26.
//

import SwiftUI

struct VideoListItem: View {
    
    // property
    var video: Video // video값을 넘겨줌
    
    var body: some View {
        HStack (spacing: 10) {
            ZStack {
                Image(video.id)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 90)
                    .cornerRadius(10)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 5)
            } // :ZStack
            
            VStack{
                Text(video.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                    .hLeading()
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            } // :VStack
            
        } // :HStack
        
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static var previews: some View {
        VideoListItem(video: Video.sampleVideoData)
    }
}
