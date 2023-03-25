//
//  MyNavigationStack.swift
//  Level2
//
//  Created by Bokyung on 2023/03/25.
//

import SwiftUI

struct MyNavigationStack: View {
    // NavigationStack: 쌓인다는 개념이 적용됨
    var body: some View {
        // stack: 처음 들어온게 밑으로 쌓이는 것(LIFO)
        NavigationStack{
            NavigationLink(value: 100) { // NavigationDestination에 value값을 전달해줌
                Text("Link to Navigation")
            }.navigationDestination(for: Int.self) { value in
                Text("Bokyung tried \(value) times")
            }
        }

    }
}

struct MyNavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationStack()
    }
}
