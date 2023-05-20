//
//  iOSDeviceViewModel.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/07.
//

import Foundation

class iOSDeviceViewModel: ObservableObject {
    // property
    @Published var iOSDeviceArray: [iOSDeviceModel] = []
    
    // ViewModel이 초기화될때마다 실행될 함수
    init() {
        getData()
    }
    
    func getData() {
        // 값 선언
        let iPhone = iOSDeviceModel(name: "아이폰")
        let iPad = iOSDeviceModel(name: "아이패드")
        let iMac = iOSDeviceModel(name: "아이맥")
        let appleWatch = iOSDeviceModel(name: "애플워치")
        
        // 값 넣기
        self.iOSDeviceArray.append(iPhone)
        self.iOSDeviceArray.append(iPad)
        self.iOSDeviceArray.append(iMac)
        self.iOSDeviceArray.append(appleWatch)
        
    }
}
