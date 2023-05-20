//
//  ForEachLoop.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/06.
//

import SwiftUI

struct ForEachLoop: View {
    // 변수 생성
    var data: [String] = ["Hi", "Hello", "Hey everyone"]
    
    var body: some View {
        // 1번 0~9 반복
        VStack {
            ForEach(0..<10) { index in
                HStack {
                    Circle()
                        .frame(width: 20, height: 20)
                    Text("인덱스 번호: \(index)")
                }
            }
            Divider()
            
            // 2번 data의 값을 가져와서 id를 부여해줌, item의 개수만큼 반복
            ForEach(data, id: \.self) { item in
                Text(item)
            }
            
        }
    }
}

struct ForEachLoop_Previews: PreviewProvider {
    static var previews: some View {
        ForEachLoop()
    }
}
