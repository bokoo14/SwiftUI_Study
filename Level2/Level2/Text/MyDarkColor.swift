//
//  MyDarkColor.swift
//  Level2
//
//  Created by Bokyung on 2023/03/24.
//

import SwiftUI

struct MyDarkColor: View {
    var body: some View {
        //다크모드를 지원하는 color
        Text("Bokoo")
            .background(Color("MyColor"))
    }
}

struct MyDarkColor_Previews: PreviewProvider {
    static var previews: some View {
        MyDarkColor()
    }
}
