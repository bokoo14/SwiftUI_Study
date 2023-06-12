//
//  testets.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/12.
//

import SwiftUI

struct testets: View {
    var body: some View {
        ScrollView { // 자식 뷰에서 크기를 받아옴
            
            Text("hello")
            Text("hello")
            Text("hello")
            
            GeometryReader { proxy in // 부모 뷰에서 크기를 받아옴
                Text("hello")
                Image("character")
            }
        }
        .border(.blue)
        
    }
}

struct testets_Previews: PreviewProvider {
    static var previews: some View {
        testets()
    }
}



// Stack이 어디서 크기를 가지고 오는지 알아야 한다
// 예: ZStack, VStack, ScrollView는 하위 뷰에서 크기를 가져옴
// GeometryReader는 상위 뷰에서 크기를 가져옴



// 말선생 특강 ❤️
// observable, observed -> 뷰에 종속, 값이 바뀌면 뷰를 다시 그림
// stateobject: 값에 종속, 값이 바뀌더라도 뷰를 다시 그리지는 않음

// 보통 상위 뷰는 observedObject를 쓰고
// 하위 뷰는 stateObject를 쓴다!

// 왜냐히면 상위 뷰에서 값을 바꾸면 하위뷰의 값은 바뀌면 안되기 때문..!!


// 숙제
// tabView, Geometry Reader

