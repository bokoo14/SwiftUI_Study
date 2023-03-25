//
//  MyProgress.swift
//  Level2
//
//  Created by Bokyung on 2023/03/25.
//

import SwiftUI

struct MyProgress: View {
    // progressView
    @State var progress: Double = 0
    
    var body: some View {
        
        VStack {
            ProgressView("Loading...", value: progress, total: 100) // 어떤 작업의 진행상황을 막대형식으로 알려줌
            ProgressView { // ProgressView(label: ) 로딩 이미지와 텍스트를 함꼐 보여줌
                Text("로딩 중.. 진행하시려면 Go!를 계속 눌러주세요.")
            }
            // ProgressView() // 로딩 이미지를 보여줌
            Button {
                progress += 5
            } label: {
                Text("Go!")
            }
        }
        .padding()
        
    }
}

struct MyProgress_Previews: PreviewProvider {
    static var previews: some View {
        MyProgress()
    }
}
