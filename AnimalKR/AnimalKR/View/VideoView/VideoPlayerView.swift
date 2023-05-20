//
//  VideoPlayerView.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/26.
//

import SwiftUI

struct VideoPlayerView: View {
    
    // property
    let video: Video
    
    var body: some View {
        NavigationView {
            // 비디오의 아이디를 넘겨줌
            VStack {
                YouTubeView(videoID: video.videoid)
            } // :VStack
            .navigationTitle("\(video.name)")
            .navigationBarTitleDisplayMode(.inline)
            .frame(height: .screenHeight*0.4)
        } // Navigation
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(video: Video.sampleVideoData)
    }
}
