//
//  MyAppear.swift
//  Level2
//
//  Created by Bokyung on 2023/03/25.
//

import SwiftUI

struct MyAppear: View {
    // 화면이 나올 때, 사라질 때 -> 해야할 일이 있을때 추가하는 방법
    @State var name: String = "NoName"
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Text(name)
                .onAppear { // view가 생성되기 직전
                    name = "Bokyung"
                }
                .onDisappear {
                    name = "Luna"
                }.sheet(isPresented: $isPresented) {
                    Text("this is Modal") //modal이 나타나도 disappear되지 않았기 때문에 name = "Bokyung"
                }
            
            Button {
                isPresented.toggle()
            } label: {
                Text("Change")
                    .onAppear{
                        print("On Appear")
                    }
                    .onDisappear {
                        print("On Disappear")
                    }
            }
        }
        
    }
}


struct MyAppear_Previews: PreviewProvider {
    static var previews: some View {
        MyAppear()
    }
}
