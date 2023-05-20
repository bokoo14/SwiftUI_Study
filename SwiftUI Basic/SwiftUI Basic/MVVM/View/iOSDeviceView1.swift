//
//  iOSDeviceView1.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/07.
//

import SwiftUI

struct iOSDeviceView1: View {
    // 처음 ViewModel을 초기화할 때는 @StateObject로 불러오기
    @StateObject var viewModel: iOSDeviceViewModel = iOSDeviceViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.iOSDeviceArray) { item in
                    NavigationLink {
                        // destination
                        iOSDeviceView2(selectedItem: item.name)
                    } label: {
                        Text(item.name)
                    } // : NavigationLink

                } // : ForEach
            } // : List
        } // Navigation
        .environmentObject(viewModel) // Navigation 하위 뷰에 ViewModel을 environmentObject로 넘겨줌
    }
}

struct iOSDeviceView1_Previews: PreviewProvider {
    static var previews: some View {
        iOSDeviceView1()
    }
}
