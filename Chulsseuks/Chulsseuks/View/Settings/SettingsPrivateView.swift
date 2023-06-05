//
//  SettingsPrivateView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/05.
//

import SwiftUI

struct SettingsPrivateView: View {
    // 노션링크로 연결이 되도록 해야 함
    var body: some View {
        VStack{
            NotionView(notionLink: "6e9929597e54446280977d7627f2f1a8")
        }
        
    }
}

struct SettingsPrivateView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPrivateView()
    }
}
