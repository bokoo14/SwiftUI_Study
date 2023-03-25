//
//  MyLabel.swift
//  Level2
//
//  Created by Bokyung on 2023/03/25.
//

import SwiftUI

struct MyLabel: View {
    var body: some View {
        // Label: Text와 Image를 한 번에 보여주는 방법
        VStack{
            HStack{
                // Text는 이미지 하나, 텍스트 각각 하나임
                Text(Image(systemName: "heart"))
                Text("Bokyung")
            }
            // Label은 텍스트와 이미지 두개가 하나임
            Label("Bokyung", systemImage: "heart")
        }
    }
}

struct MyLabel_Previews: PreviewProvider {
    static var previews: some View {
        MyLabel()
    }
}
