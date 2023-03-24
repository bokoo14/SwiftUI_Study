//
//  ContentView.swift
//  Level2
//
//  Created by Bokyung on 2023/03/24.
//

// 한 조각씩 배우는 SwiftUI - 레벨2
import SwiftUI

struct ContentView: View {
    var body: some View {
        // 다크모드를 지원하는 color
        //        Text("Bokoo")
        //            .background(Color("MyColor"))
        
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
