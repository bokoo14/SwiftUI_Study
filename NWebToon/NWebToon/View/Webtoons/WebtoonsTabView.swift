//
//  WebtoonsTabView.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/23.
//

import SwiftUI

struct WebtoonsTabView: View {
    @State private var selectedTab: TabModel = tabmodel[0]
    @State private var tabModel: [TabModel] = tabmodel
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                ForEach(tabModel) { currentTab in
                    WebtoonsListView(selectedDay: currentTab.tabView)
                        .padding(.top, 70)
                        .tag(currentTab)
                } // ForEach
            } // TabView
            .tabViewStyle(.page(indexDisplayMode: .never))
            .overlay(alignment: .top) {
                Text("헤더 부분 .. ㅜㅜ")
            }
        }
      
    }
}

struct WebtoonsTabView_Previews: PreviewProvider {
    static var previews: some View {
        WebtoonsTabView()
    }
}
