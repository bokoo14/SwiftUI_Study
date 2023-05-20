//
//  iOSDeviceView3.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/07.
//

import SwiftUI

struct iOSDeviceView3: View {
    // property
    // @StateObject에서 선언한 viewModel을 @EnvironmentObject를 통해 가져오기
    @EnvironmentObject var viewModel: iOSDeviceViewModel
    
    var body: some View {
        ZStack{
            // background
            Color.cyan.ignoresSafeArea()
            
            ScrollView{
                VStack (spacing: 20) {
                    ForEach(viewModel.iOSDeviceArray) { item in
                        Text(item.name)
                    }
                } // : VStack
                .foregroundColor(.white)
                .font(.largeTitle)
            } // :ScrollView
        } // : ZStack
        
    }
}

struct iOSDeviceView3_Previews: PreviewProvider {
    static var previews: some View {
        iOSDeviceView3()
            .environmentObject(iOSDeviceViewModel()) // environmentObject가 강제적으로 iOSDeviceViewModel임을 알려줌
        
    }
}
