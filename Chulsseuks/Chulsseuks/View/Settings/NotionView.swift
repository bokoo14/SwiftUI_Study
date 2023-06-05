//
//  NotionView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/05.
//

import SwiftUI
import WebKit

// UIViewRepresentable: A wrapper for a UIKit view that you use to integrate that view into your SwiftUI view hierarchy.
// UIKit에 있는 것을 가져다가 쓰는 것
// 유튜브 링크를 거는 것은 SwiftUI에서는 구현하기 힘들기 때문에 이미 구현된 UIKit에서 가져다 쓰는 것

//노션 링크: https://shard-jaguar-eb6.notion.site/6e9929597e54446280977d7627f2f1a8

struct NotionView: UIViewRepresentable {
    let notionLink: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // URL은 항상 guard let을 붙여줘야 한다
        guard let notionURL = URL(string: "https://shard-jaguar-eb6.notion.site/\(notionLink)") else { return }
        uiView.scrollView.isScrollEnabled = false // 화면이 스크롤이 되지 않도록 해줌
        uiView.load(URLRequest(url: notionURL)) // youtube URL을 로드해줌
    }
}



