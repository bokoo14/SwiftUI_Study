//
//  MyDivider.swift
//  Level2
//
//  Created by Bokyung on 2023/03/24.
//

import SwiftUI

struct MyDivider: View {
    var body: some View {
        // divider
        VStack{
            Divider() // 내가 원하는 요소들을 나눠줌
            HStack {
                Image(systemName: "heart")
                Divider().frame(height: 30)
                Text("my love .. ")
                Divider().frame(height: 30)
            }
            
            Divider()
                .background(.red)
                .frame(width: 150)
            
            HStack {
                Image(systemName: "heart.fill")
                Divider().frame(height: 30)
                Text("love .. is..")
                Divider().frame(height: 30)
            }
            
            Divider()
        }
    }
}

struct MyDivider_Previews: PreviewProvider {
    static var previews: some View {
        MyDivider()
    }
}
