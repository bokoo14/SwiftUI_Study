//
//  MyModal.swift
//  Level2
//
//  Created by Bokyung on 2023/03/24.
//

import SwiftUI

struct MyModal: View {
    @State var isShowingModal: Bool = false
    var body: some View {
        //Modal View
        //버튼을 누르면 modal view를 불러올 수 있다
        Button {
            isShowingModal = true
        } label: {
            Text("Call Modal")
        }.sheet(isPresented: $isShowingModal) { // 바인딩 변수 $isShowingModal
            ZStack {
                Color.orange.ignoresSafeArea()
                Text("Modal View")
            }
        }
        
        
        // Full Screen
        //        Button {
        //            isShowingModal = true
        //        } label: {
        //            Text("Call FullScreen")
        //        }.fullScreenCover(isPresented: $isShowingModal) {
        //            ZStack{
        //                Color.orange.ignoresSafeArea()
        //                VStack{
        //                    Text("Modal View")
        //                    Button {
        //                        isShowingModal = false
        //                    } label: {
        //                        Text("dismiss!")
        //                    }
        //                }
        //            }
        //      }
        
        
    }
}

struct MyModal_Previews: PreviewProvider {
    static var previews: some View {
        MyModal()
    }
}
