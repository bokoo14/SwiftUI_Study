//
//  Models.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/06/25.
//

import Foundation
import SwiftUI

// MARK: iPhone 14 Pro 프로 그 이상.
struct MainBanner {
    let imageTitle: String
    let productColor: String
}

var bannerContents = [
    MainBanner(imageTitle: "ImgMain01", productColor: "딥퍼플"),
    MainBanner(imageTitle: "ImgMain02", productColor: "골드"),
    MainBanner(imageTitle: "ImgMain03", productColor: "실버"),
    MainBanner(imageTitle: "ImgMain04", productColor: "블랙")
]

