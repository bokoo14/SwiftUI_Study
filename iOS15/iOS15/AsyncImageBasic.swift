//
//  AsyncImageBasic.swift
//  iOS15
//
//  Created by Bokyung on 2023/04/29.
//

import SwiftUI

struct AsyncImageBasic: View {
    // property
    // AsyncImage: 인터넷 외부 경로 이미지를 쉽게 가져올 수 있음
    let url = URL(string: "https://picsum.photos/200")
    
    var body: some View {
        VStack (spacing: 20) {
            // 일반적인 AsyncImage사용 with ProgressView()
            Text("1. 일반적인 AsyncImage 사용 예시")
                .font(.headline)
            
            AsyncImage(url: url) { Image in
                Image // 랜덤한 이미지
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
            } placeholder: {
                ProgressView()
            }
            
            Divider()
            
            // Switch를 통한 Image error
            
            /**
             Switch Case
             case empty -> Image없음
             case success -> Image로드 없음
             case failure -> Image로드 실패 with error
             */
            
            Text("2. Switch를 통한 Image error처리")
                .font(.headline)
            
            AsyncImage(url: url) { raw in
                // content
                switch raw {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .cornerRadius(20)
                case .failure:
                    Text("Image가 로드되지 않음")
                default:
                    Text("Image가 로드되지 않음")
                } // :Switch
            } //: AsyncImage

            
        } // :VStack
    }
}

struct AsyncImageBasic_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageBasic()
    }
}
