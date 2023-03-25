//
//  MyNavigationView.swift
//  Level2
//
//  Created by Bokyung on 2023/03/25.
//

import SwiftUI

struct MyNavigationView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("My View1")) {
                ZStack {
                    Color.yellow
                    Text("go to My View Page")
                }
            }.navigationTitle("this is navigation!") // 페이지의 위에 나타나는 텍스트, 뒤로가기 버튼의 텍스트
        }
        
        // WWDC에서 iOS16부터는 NavigationView대신, NavigationStack or NavigationSplitView를 써야한다고 발표..
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
