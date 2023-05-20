//
//  ActionSheetBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/10.
//

import SwiftUI

struct ActionSheetBasic: View {
    @State var showActionSheet: Bool = false
    @State var resultActionSheet: String = ""
    
    
    var body: some View {
        VStack {
            // show result
            Text(resultActionSheet)
                .font(.largeTitle)
            Spacer()
            
            // Content
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                Text("Bokyung")
                Spacer()
                
                Button {
                    // action
                    showActionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                }
            } // : HStack
            .padding(.horizontal)
            Rectangle()
                .aspectRatio(1, contentMode: .fit)
            
            Spacer()
        } // : VStack
        .confirmationDialog(
            "제목", // 제목
            isPresented: $showActionSheet, // binding
            titleVisibility: .visible, // 제목이 보이도록
            actions: {
                Button("기본", role: .destructive) {
                    resultActionSheet = "기본 선택"
                }
                Button("카메라", role: .destructive) {
                    resultActionSheet = "카메라 선택"
                }
                Button("공유", role: .destructive) {
                    resultActionSheet = "공유 선택"
                }
                Button("취소", role: .cancel) {
                    resultActionSheet = "취소 선택"
                }
            },
            message: {
                Text("원하는 기능을 선택해주세요.")
            }
        ) // : confirmationDialog
    }
}

struct ActionSheetBasic_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetBasic()
    }
}
