//
//  AppInfoContent.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/26.
//

import SwiftUI

struct AppInfoContent: View {
    // property
    var name: String
    
    // optional property
    var content: String? = nil
    var linklabel: String? = nil
    var linkDestination: String? = nil
    
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 5)
            
            HStack {
                Text(name)
                    .foregroundColor(.gray)
                
                // Condition
                if (content != nil) {
                    // 1. name, content가 있는 경우
                    Text(content ?? "noValue") // content가 optional이라서 ?? 를 붙여줘야 함
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .hTrailing()
                } else if (linklabel != nil && linkDestination != nil){
                    // 2. linklabel, linkDestination이 있는 경우
                    // linkDestination이 optional이라서 강제 binding해줌
                    Link(destination: URL(string: "https://\(linkDestination!)")!) {
                        // label
                        Spacer()
                        Text(linklabel!)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Image(systemName: "arrow.up.right.square")
                            .foregroundColor(.accentColor)
                    }
                } else {
                    // 아무 것도 없을때
                    EmptyView()
                }
            } // :HStack
        } // : VStack
        
    }
}

struct AppInfoContent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppInfoContent(name: "Sample", content: "Jacob Ko")
            AppInfoContent(name: "Sample2", linklabel: "Bokoo's Blog", linkDestination: "bokoo.tistory.com")
        }
        
    }
}
