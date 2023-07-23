//
//  WebtoonsTabView.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/23.
//

import SwiftUI

struct WebtoonsTabView: View {
    @State var selectedTab: TabModel = tabmodel[0]
    @State var tabModel: [TabModel] = tabmodel
    
    var body: some View {
        VStack (spacing: 0){
            TabBar(items: tabModel, selectedTab: $selectedTab)
            Divider()
                .frame(minHeight: 1)
                .background(Color("DividerGray"))
            
            TabView(selection: $selectedTab) {
                ForEach(tabModel) { currentTab in
                    WebtoonsListView(selectedDay: currentTab.tabView)
                    //.padding(.top, 140)
                        .tag(currentTab)
                } // ForEach
            } // TabView
            .tabViewStyle(.page(indexDisplayMode: .never))
            //            .overlay (alignment: .top){
            //                VStack(spacing: 0) {
            //                    TabBar(items: tabModel, selectedTab: $selectedTab)
            //                    Divider()
            //                        .frame(minHeight: 1)
            //                        .background(Color("DividerGray"))
            //                }
            //} // overlay
            
        } // VStack
        .border(.red)
        .background(.red)
    }
}


struct TabBar: View {
    var items: [TabModel]
    @Binding var selectedTab: TabModel
    
    var body: some View {
        HStack {
            ForEach(items) { item in
                Button(action: {
                    selectedTab = item
                }) {
                    VStack(spacing: 14) {
                        Text(item.tabTitle)
                            .foregroundColor(selectedTab == item ? Color("FontGreen") : Color("FontBlack"))
                            .padding(.horizontal, 10)
                        
                        Divider()
                            .frame(minHeight: 2)
                            .frame(width: selectedTab.tabTitle == "신작" ? 25 : 13)
                            .background(selectedTab == item ? Color("FontGreen") : .clear)
                    } // VStack
                }
            } // ForEach
        } // HStack
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .background(Color.white)
    }
}


struct WebtoonsTabView_Previews: PreviewProvider {
    static var previews: some View {
        WebtoonsTabView()
    }
}
