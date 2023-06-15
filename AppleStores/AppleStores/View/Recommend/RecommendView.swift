//
//  RecommendView.swift
//  AppleStores
//
//  Created by Bokyung on 2023/06/15.
//

import SwiftUI

struct RecommendView: View {
    var body: some View {
        VStack(spacing: 0){
            HStack {
                Text("추천")
                    .font(.system(size: 24, weight: .semibold))
                    .padding(EdgeInsets(top: 38, leading: 20, bottom: 38, trailing: 0))
                    .border(.red)
                Spacer()
            }
            .border(.red)
        }
        .frame(height: 714)
        .frame(maxWidth: .infinity)
        .border(.red)
    }
}

struct RecommendView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendView()
    }
}
