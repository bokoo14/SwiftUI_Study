//
//  ContentView.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/04.
//

import SwiftUI

struct BindingView: View {
    // @Binding - @State를 Subview(하위 뷰)에서 사용하기 위한 Wrapper
    @State var backgroundColor: Color = Color.green
    @State var title: String = "Binding View"
    
    var body: some View {
        ZStack {
            // background
            backgroundColor
                .ignoresSafeArea()
            
            // content
            VStack {
                Text(title)
                
                // button
                // parameter로 @State의 값에 $를 붙여줌
                BindingChild(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

struct BindingView_Previews: PreviewProvider {
    static var previews: some View {
        BindingView()
    }
}
