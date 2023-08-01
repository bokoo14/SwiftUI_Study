//
//  Header.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/23.
//

import Foundation

struct HeaderModel: Identifiable {
    let id: UUID = UUID()
    let imageTitle: String
    let lineImageTitle: String
    let index: Int
}

let headerInfo: [HeaderModel] = {
    var headerArray: [HeaderModel] = []
    for index in 0...7 {
        let header = HeaderModel(imageTitle: "ImgBanner0\(index)", lineImageTitle: "ImgLineBanner0\(index)", index: index)
        headerArray.append(header)
    }
    return headerArray
}()
