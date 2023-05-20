//
//  TextFieldBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/10.
//

import SwiftUI

struct TextFieldBasic: View {
    // property
    @State var inputText: String = ""
    @State var userNameData: [String] = []
    
    func isTextEnough() -> Bool{
        // 2개 이상의 텍스트가 되면 true, 아니면 false
        if inputText.count>=2 {
            return true
        } else {
            return false
        }
    }
    
    func saveText() {
        // usesrNameData에 한글자씩 append해줌
        userNameData.append(inputText)
        inputText = ""
    }
    
    var body: some View {
        NavigationView {
            VStack (spacing: 20) {
                // TextField 한줄 - 적은양의 text 입력시 사용
                TextField("최소 2글자 이상 입력", text: $inputText)
                    //.textFieldStyle(.roundedBorder)
                    .padding()
                    .background(.gray.opacity(0.3))
                    .cornerRadius(10)
                    .font(.headline)
                
                // texteditor 여러줄 - 긴글의 text를 입력할때 사용
                TextEditor(text: $inputText)
                    .frame(height: 250)
                    .colorMultiply(.gray.opacity(0.5)) // texteditor의 배경색 지정
                    .cornerRadius(10)
                
                
                Button {
                    // 이름이 2글자 이상일때 saveText가 되도록 조건 설정
                    if isTextEnough() {
                        saveText()
                    }
                } label: {
                    Text("save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(isTextEnough() ? .blue: .gray)
                        .cornerRadius(10)
                        .font(.headline)
                } // : Button
                .disabled(!isTextEnough()) // isTextEnough()가 false일때 실행 X
                
                // 입력값 출력
                ForEach(userNameData, id: \.self) { item in
                    Text(item)
                }
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("당신의 이름은?")
            
        } // : NavigaitonView
    } // : body
}

struct TextFieldBasic_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBasic()
    }
}
