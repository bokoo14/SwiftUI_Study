//
//  MyShape.swift
//  Level3
//
//  Created by Bokyung on 2023/03/25.
//

import SwiftUI

struct MyShape: View {
    // shape
    // 도형을 그리는 데에도 사용할 수 있고, 이미지를 자르는 데에도 사용할 수 있다
    var body: some View {
        //        Circle()
        //            .foregroundColor(.green)
        //            .background(.red)
        
        
        //        RoundedRectangle(cornerRadius: 30)
        //            .foregroundColor(.yellow)
        //            .frame(height: 300)
        
        
        //        Ellipse()
        //            .foregroundColor(.yellow)
        //            .frame(height: 300)
        
        
        //        Capsule()
        //            .foregroundColor(.yellow)
        //            .frame(height: 300)
        
        
        // 이미 만들어진 이미지를 자르는데에 사용할 수 있음
        Image(systemName: "person")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 200)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

struct MyShape_Previews: PreviewProvider {
    static var previews: some View {
        MyShape()
    }
}
