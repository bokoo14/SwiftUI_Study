//
//  VideoView.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/24.
//

import SwiftUI

struct VideoView: View {
    
    // property - HomeView에서 넘겨받은 데이터
    @ObservedObject var vm: AnimalViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.videos) { video in
                    NavigationLink {
                        // destination
                        VideoPlayerView(video: video)
                    } label: {
                        VideoListItem(video: video) // video라는 값만 전달
                    }

                } // :ForEach
                .listStyle(.plain)
                .navigationTitle("비디오")
                .navigationBarTitleDisplayMode(.inline)
            } // :Navigation
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(vm: AnimalViewModel())
    }
}
