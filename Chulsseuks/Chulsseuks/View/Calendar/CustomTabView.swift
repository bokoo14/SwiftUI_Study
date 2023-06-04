//
//  CustomTabView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/04.
//

import SwiftUI

struct CustomTabView: View {
    // 상단의 tabView에 들어갈 내용
    enum CalendarTabInfo: String, CaseIterable {
        case one = "이번달 출석 점수"
        case two = "전체 출석 점수"
    }
    
    // 선택된 picker의 값
    @State var selectedPicker: CalendarTabInfo = .one
    
    var body: some View {
        ZStack{
            Color.backgroundColor.ignoresSafeArea()
            VStack{
                Picker("Calendar", selection: $selectedPicker) {
                    ForEach(CalendarTabInfo.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                } // :Picker
                .pickerStyle(.segmented)
                .padding()
                
                // selected된 Tab값을 binding
                TabDetailView(selectedTab: $selectedPicker)

            }
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
