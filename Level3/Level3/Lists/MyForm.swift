//
//  MyForm.swift
//  Level3
//
//  Created by Bokyung on 2023/03/29.
//

import SwiftUI

struct MyForm: View {
    // form: 여러 개의 컴포는터를 묶어줌
    // list는 선택, form은 단순 그룹핑, 크게 구분하지는 않음
    var body: some View {
        Form {
            HStack{
                Image(systemName: "heart")
                Text("bokyung")
            }
            HStack{
                Image(systemName: "heart.fill")
                Text("bokoo")
            }
            HStack{
                Image(systemName: "bolt")
                Text("luna")
            }
        }
    }
}

struct MyForm_Previews: PreviewProvider {
    static var previews: some View {
        MyForm()
    }
}
