//
//  Icon.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/05.
//

import SwiftUI

struct Icon: View {
    var body: some View {
        VStack (spacing: 20) {
            Image(systemName: "person.fill.badge.plus")
                .resizable()
            // redermode 에서 original 로 하게되면 실제 color 에서 multi color 변경되게 됩니다.
            // 즉 고유 값 컬러로 변경되어서 color 를 변경하더라고 변경되지 않는 컬러 값이 됩니다
                .renderingMode(.original)
                .scaledToFill()
                .foregroundColor(Color.red)
                .frame(width: 300, height: 300)
        }
    }
}

struct Icon_Previews: PreviewProvider {
    static var previews: some View {
        Icon()
    }
}
