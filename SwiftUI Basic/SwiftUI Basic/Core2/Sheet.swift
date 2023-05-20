//
//  Sheet.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/07.
//

import SwiftUI

struct Sheet: View {
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            // background
            Color.green.ignoresSafeArea()
            
            // content
            Button {
                showSheet.toggle()
            } label: {
                Text("Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
            } // : Button
            .sheet(isPresented: $showSheet) {
                Sheet2()
            }
            // 전체 화면을 차지, 밑으로 내릴 수 없음
            //            .fullScreenCover(isPresented: $showSheet) {
            //                Sheet2()
            //            }
        } // : ZStack
        
    }
}

struct Sheet_Previews: PreviewProvider {
    static var previews: some View {
        Sheet()
    }
}
