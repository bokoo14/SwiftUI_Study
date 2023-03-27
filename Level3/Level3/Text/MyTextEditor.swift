//
//  MyTextEditor.swift
//  Level3
//
//  Created by Bokyung on 2023/03/26.
//

import SwiftUI

struct MyTextEditor: View {
    // TextEditor: 긴 글을 입력받을 수 있음
    // TextField와 TextEditor의 차이? TextField는 한줄로 입력을 받을 수 있고, TextEditor는 여러 줄을 입력받을 수 있음
    @State var inputText: String = "default"
    
    var body: some View {
        
        //        ZStack {
        //            Color.orange
        //            TextEditor(text: $inputText)
        //                .padding()
        //                .foregroundColor(.purple) // inputField안의 text색상
        //                .frame(height: 200) // textEditor의 크기
        //        }
        
        TextEditor(text: $inputText)
            .padding()
            .foregroundColor(.orange)
            .background(.green)
            .frame(height: 300)
            .multilineTextAlignment(.center)
        //            .onChange(of: inputText) { newValue in
        //                print(newValue) // inputText안의 값이 바뀔 때마다 print
        //            }
            .onChange(of: inputText) { newValue in
                print(newValue.count) // inputText안의 글자수를 세줌
            }
        
        
        
    }
}

struct MyTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        MyTextEditor()
    }
}
