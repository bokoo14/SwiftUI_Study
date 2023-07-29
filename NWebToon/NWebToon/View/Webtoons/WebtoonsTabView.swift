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
    
    @State private var contentAreaHeight: CGRect = .zero
    
    var body: some View {
        ScrollView {
            VStack (spacing: 0){
                        TabBar(items: tabModel, selectedTab: $selectedTab)
                        Divider()
                            .frame(minHeight: 1)
                            .background(Color("DividerGray"))
                        
                        // 높이값이 상수면 데이터값이 추가된 것을 알 수 없음
                        // 탭뷰의 크기가 탭뷰안에 있는 자식안의 크기를 탭뷰의 높이값으로 잡아줘야 함
                        // geometry로 잡아줘서
                        // geo로 값을 받아와서 height값을 잡아줘야 한다

                        
                        TabView(selection: $selectedTab) {
                            ForEach(tabModel) { currentTab in
                                WebtoonsListView(selectedDay: currentTab.tabView)
                                    .tag(currentTab)
                                    .modifier(GetHeightModifier())
                                     // TabView의 각각의 height를 가져와서 저장
                            } // ForEach
                        } // TabView
                        .tabViewStyle(.page)
                        .frame(height: contentAreaHeight.size.height)
                        .onPreferenceChange(ContentRectSize.self) { rects in
                            self.contentAreaHeight = rects
                            print(rects.height)
                        }
                        
                    } // VStack
//            .background(.red)
        }
    }
}


// Tab바 상단의 월~금, 신작 버튼
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
//        WebtoonsTabView()
        WebtoonsTabView()
//        ContentView()
    }
}
