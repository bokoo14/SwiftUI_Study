//
//  Tab.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/23.
//

import Foundation
// Generic struct 'TabView' requires that 'TabModel' conform to 'Hashable'
struct TabModel: Identifiable, Equatable, Hashable {
    static func ==(lhs: TabModel, rhs: TabModel) -> Bool {
           // 구조체의 모든 속성이 동일한지 비교하도록 구현합니다.
           return lhs.id == rhs.id
               && lhs.tabTitle == rhs.tabTitle
               && lhs.tabView == rhs.tabView
       }
    
    var id: UUID = UUID()
    var tabTitle: String
    var tabView: [WebToons]
}

var tabmodel: [TabModel] = [
    TabModel(tabTitle: "월", tabView: mondayWebToons),
    TabModel(tabTitle: "화", tabView: tuesdayWebToons),
    TabModel(tabTitle: "수", tabView: wednesdayWebToons),
    TabModel(tabTitle: "목", tabView: thursdayWebToons),
    TabModel(tabTitle: "금", tabView: fridayWebToons),
    TabModel(tabTitle: "토", tabView: SaturdayWebToons),
    TabModel(tabTitle: "일", tabView: SundayWebToons),
    TabModel(tabTitle: "신작", tabView: NewWebToons)
]
