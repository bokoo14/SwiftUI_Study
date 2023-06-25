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


//imageLayout(imageTitle: "ImgContentL01", overlayAlignment: .top, leadingOffset: 0, topOffset: 40) {
//    Text("채드도 놀란")
//        .foregroundColor(Color("ColorFontWhite"))
//        .font(.system(size: 20, weight: .semibold))
//        .border(.red)
//
//    Text("iPhone 14 Pro")
//        .foregroundColor(Color("ColorFontWhite"))
//        .font(.system(size: 30, weight: .bold))
//        .border(.red)
//}

// MARK: 채드도 놀란 iPhone 14 Pro
struct DescribeCard: Identifiable {
    let id: UUID = UUID()
    let imageTitle: String
    
    let overlayAlignment: Alignment
    let leadingOffset: Double
    let topOffset: Double
    
    let text1: String
    let text1FontSize: Double
    let text1FontColor: Color
    let text1FontWeight: UIFont.Weight
    
    let text2: String
    let text2FontSize: Double
    let text2FontColor: Color
    let text2FontWeight: UIFont.Weight
}

var describeContents = [
    DescribeCard(imageTitle:  "ImgContentL01", overlayAlignment: .top, leadingOffset: 0, topOffset: 40, text1: "채드도 놀란", text1FontSize: 20, text1FontColor: Color("ColorFontWhite"),text1FontWeight: .semibold, text2: "iPhone 14 Pro", text2FontSize: 30, text2FontColor: Color("ColorFontWhite"), text2FontWeight: .bold),
DescribeCard(imageTitle:  "ImgContentL02", overlayAlignment: .top, leadingOffset: 0, topOffset: 40, text1: "Dynamic Island", text1FontSize: 20, text1FontColor: Color("ColorFontWhite"),text1FontWeight: .semibold, text2: "iPhone을 다루는 완전히\n새로운 방법", text2FontSize: 24, text2FontColor: Color("ColorFontWhite"), text2FontWeight: .bold),
DescribeCard(imageTitle:  "ImgContentSm01", overlayAlignment: .leading, leadingOffset: 37, topOffset: 40, text1: "그 모든걸\n가능케 하는\n브레인", text1FontSize: 22, text1FontColor: Color("ColorFontPurpleDown"),text1FontWeight: .semibold, text2: "", text2FontSize: 0, text2FontColor: Color("ColorFontPurpleDown"), text2FontWeight: .bold),
DescribeCard(imageTitle:  "ImgContentSm02", overlayAlignment: .top, leadingOffset: 0, topOffset: 75, text1: "오래 가는 배터리", text1FontSize: 22, text1FontColor: Color("ColorFontPurpleDown"),text1FontWeight: .semibold, text2: "온종일,\n올인.", text2FontSize: 54, text2FontColor: Color("ColorFontPurpleDown"), text2FontWeight: .bold),
DescribeCard(imageTitle:  "ImgContentL03", overlayAlignment: .top, leadingOffset: 0, topOffset: 40, text1: "상시표시형 디스플레이.\n잠긴 동안에도\n잠드는 법 없이", text1FontSize: 24, text1FontColor: Color("ColorFontPurpleDown"),text1FontWeight: .semibold, text2: "", text2FontSize: 0, text2FontColor: Color("ColorFontPurpleDown"), text2FontWeight: .bold),
DescribeCard(imageTitle:  "ImgContentL04", overlayAlignment: .top, leadingOffset: 0, topOffset: 42, text1: "Ceramic Shield", text1FontSize: 20, text1FontColor: Color("ColorFontWhite"),text1FontWeight: .semibold, text2: "그 어떤 스마트폰\n글래스보다 견고한 소재.", text2FontSize: 24, text2FontColor: Color("ColorFontPurpleDown"), text2FontWeight: .bold)
]

