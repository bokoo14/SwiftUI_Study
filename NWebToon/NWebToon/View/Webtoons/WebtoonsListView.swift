//
//  WebtoonsListView.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/23.
//

import SwiftUI

struct WebtoonsListView: View {
    var selectedDay: [WebToons]
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: .center),
        GridItem(.flexible(), spacing: 6, alignment: .center),
        GridItem(.flexible(), spacing: 6, alignment: .center)]
    
    var body: some View {
            LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                ForEach(selectedDay) { modaywebtoons in
                    WebtoonsBoxView(imageName: modaywebtoons.imageName, imageTitle: modaywebtoons.imageTitle, imageDetail: modaywebtoons.imageDetail)
                }
            } // LazyVGrid
            .padding(.horizontal, 15)
            .frame(height: UIScreen.main.bounds.height)
            .border(.red)
    }
}

struct WebtoonsListView_Previews: PreviewProvider {
    static var previews: some View {
        WebtoonsListView(selectedDay: mondayWebToons)
    }
}
