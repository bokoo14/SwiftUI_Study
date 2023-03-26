//
//  MyPicker.swift
//  Level3
//
//  Created by Bokyung on 2023/03/26.
//

import SwiftUI

struct MyPicker: View {
    @State var pickedItem: Int = 0
    
    var body: some View {
        VStack {
            Text(pickedItem.description)
            
            // 선택된 값은 selection에서 볼 수 있도록 바인딩 변수를 활용한다
            Picker(selection: $pickedItem, label: Text("Picker")) {
                Text("1 입니다").tag(1) // Text는 선택지, tag는 선택이 되었을때 나타나는 값
                Text("2 입니다").tag(2) // tag는 항상 숫자가 들어가야 한다
            }
        }
        
    }
}

struct MyPicker_Previews: PreviewProvider {
    static var previews: some View {
        MyPicker()
    }
}
