//
//  CoverImageView.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/25.
//

import SwiftUI

struct CoverImageView: View {
    // property
    @ObservedObject var vm: AnimalViewModel
    
    var body: some View {
        TabView {
            ForEach(vm.coverImages) { cover in
                Image(cover.name)
                    .resizable()
                    .scaledToFill()
            } // :ForEach
        } // :TabView
        .tabViewStyle(.page)
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView(vm: AnimalViewModel())
            .previewLayout(.fixed(width: 400, height: 300))
        // 프리뷰의 크기를 조정
    }
}
