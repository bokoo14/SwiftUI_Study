//
//  NavigationStackBasic.swift
//  iOS16
//
//  Created by Bokyung on 2023/05/17.
//

import SwiftUI

struct NavigationStackBasic: View {
    @State var stack = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $stack) {
            NavigationLink("2번째 페이지 이동", value: 40)
                .navigationDestination(for: Int.self) { value in
                    VStack (spacing: 20){
                        Text("2번째 페이지 입니다, 나의 나이는? \(value)")
                        NavigationLink ("세번째 페이지 이동", value: 30)
                        Button {
                            //stack.removeLast() // navigationLink의 제일 위에 쌓인 것을 하나 지움
                            stack = .init() // 초기화면으로 이동
                        } label: {
                            Text("이전 페이지로 이동하기")
                        }
                    } //: VStack
                } //: NavigationDestination
        } //: NavigationLink
    }
}

struct NavigationStackBasic_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackBasic()
    }
}
