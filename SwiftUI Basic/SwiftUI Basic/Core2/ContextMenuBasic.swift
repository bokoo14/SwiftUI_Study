//
//  ContextMenu.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/10.
//

import SwiftUI

struct ContextMenuBasic: View {
    // property
    @State var statusText: String = "status text"
    @State var background: Color = Color.cyan
    
    var body: some View {
        VStack (spacing: 30){
            Text(statusText)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Context Menu Test")
                    .font(.headline)
                Text("이 버튼을 길게 누르면 메뉴가 나타납니다")
                    .font(.subheadline)
            } // : VStack
            .foregroundColor(.white)
            .padding(30)
            .background(background)
            .cornerRadius(20)
            .contextMenu{ // 해당 버튼을 길게 누르면 나타남
                Button {
                    statusText = "공유가 되었습니다"
                    background = .yellow
                } label: {
                    Label {
                        // title
                        Text("Share Post")
                    } icon: {
                        Image(systemName: "square.and.arrow.up")
                    }
                } // :Button
                
                Button {
                    statusText = "신고가 되었습니다"
                    background = .red
                } label: {
                    Label {
                        // title
                        Text("Report post")
                    } icon: {
                        Image(systemName: "exclamationmark.bubble")
                    }
                } // : Button
                
                Button {
                    statusText = "좋아요 추가!"
                    background = .green
                } label: {
                    Label {
                        Text("Like post")
                    } icon: {
                        Image(systemName: "hand.thumbsup")
                    }
                } // : Button
                
            } // : contextMenu
        }
    }
}

struct ContextMenuBasic_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuBasic()
    }
}
