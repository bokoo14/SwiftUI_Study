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
        VStack (spacing: 0){
            TabBar(items: tabModel, selectedTab: $selectedTab)
            Divider()
                .frame(minHeight: 1)
                .background(Color("DividerGray"))
            
            // 높이값이 상수면 데이터값이 추가된 것을 알 수 없음
            // 탭뷰의 크기가 탭뷰안에 있는 자식안의 크기를 탭뷰의 높이값으로 잡아줘야 함
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
            } // onPreferenceChange
        } // VStack
    }
}


// Tab바 상단의 월~금, 신작 버튼
struct TabBar: View {
    var items: [TabModel]
    @Binding var selectedTab: TabModel
    @Namespace var namespace
    
    var body: some View {
        HStack {
            ForEach(items) { item in
                VStack(spacing: 0) {
                    Text(item.tabTitle)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(selectedTab == item ? Color("FontGreen") : Color("FontBlack"))
                        .padding(.horizontal, items.last != item ? 4.5 : 0)
                        .padding(.bottom, 14)
                        .padding(.top, 12)
                        .border(.red)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction:0.8)){
                                selectedTab = item
                            }
                        }
                        .overlay(alignment:.bottom) {
                            if selectedTab == item {
                                activeStroke()
                                    .matchedGeometryEffect(id: "activeStroke", in: namespace)
                            }
                        }
                } // VStack
                if items.last != item {
                    Spacer()
                }
            } // ForEach
        } // HStack
        .padding(.horizontal, 15)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .border(.green)
    }
}


private func activeStroke() -> some View {
    Rectangle()
        .frame(height: 2)
        .foregroundColor(Color("FontGreen"))
}

struct WebtoonsTabView_Previews: PreviewProvider {
    static var previews: some View {
        //WebtoonsTabView()
        ContentView()
    }
}
