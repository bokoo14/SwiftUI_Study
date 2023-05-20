//
//  DetailHead.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/25.
//

import SwiftUI

struct DetailHead: View {
    // 재사용가능한 컴포넌트 만들기
    // property
    var headingImage: String
    var headingText: String
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title)
                .fontWeight(.bold)
            
        }
        
    }
}

struct DetailHead_Previews: PreviewProvider {
    static var previews: some View {
        DetailHead(headingImage: "gear", headingText: "Head Title")
    }
}
