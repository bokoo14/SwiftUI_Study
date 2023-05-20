//
//  MaterialBackgroundBasic.swift
//  iOS15
//
//  Created by Bokyung on 2023/04/29.
//

import SwiftUI

struct MaterialBackgroundBasic: View {
    /**
     MaterialBackground: 불투명도를 조절하여 특정 색상이 비쳐보이는 효과로 자연스러운 배경 효과를 사용할 수 있음
     */
    
    // property
    let url = URL(string: "https://picsum.photos/1000")
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                Spacer()
                Text("Material Background 예시")
                    .font(.headline)
                Spacer()
            } // :VStack
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            /**
             .thinMaterial
             .ultraThinMaterial
             .ultraThickMaterial
             .thickMaterial
             .regularMaterial
             */
        } // :VStack
        .background(
            AsyncImage(url: url) { image in
                image
            } placeholder: {
                ProgressView()
            })
        
    }
}

struct MaterialBackgroundBasic_Previews: PreviewProvider {
    static var previews: some View {
        MaterialBackgroundBasic()
    }
}
