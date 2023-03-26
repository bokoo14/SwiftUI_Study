//
//  MyBinding.swift
//  Level3
//
//  Created by Bokyung on 2023/03/25.
//

import SwiftUI

struct MyBinding: View {
    //binding 변수: 화면을 다시 그려도 바뀌지 않는 변수
    @State var isTurnOn: Bool = false
    @State var myText: String = ""
    
    var body: some View {
        //        Toggle(isOn: $isTurnOn) {
        //            Text("Switch")
        //        }.padding()
        
        TextField(text: $myText) {
            Text("TextField")
        }
        
    }
}

struct MyBinding_Previews: PreviewProvider {
    static var previews: some View {
        MyBinding()
    }
}
