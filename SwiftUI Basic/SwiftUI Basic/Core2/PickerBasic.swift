//
//  PickerBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/10.
//

import SwiftUI

struct PickerBasic: View {
    // property
    let typeOfPhone: [String] = [
        "에플", "삼성", "엘지", "기타"
    ]
    @State var selectedIndex: Int = 0 // 선택된 값의 index가 저장됨
    
    var body: some View {
        NavigationView {
            Form{
                Section{
                    Picker(selection: $selectedIndex) {
                        ForEach(0 ..< typeOfPhone.count, id: \.self) { index in
                            Text(typeOfPhone[index])
                        } //: Loop
                    } label: {
                        Text("기종선택")
                    } // :Picker
                    .pickerStyle(.navigationLink)
                } //: Section
                
                Text("핸드폰 제조사는 \(typeOfPhone[selectedIndex])입니다")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                
            } // :Form
            .navigationTitle(Text("현재 시용중인 핸드폰 기종은?"))
            .navigationBarTitleDisplayMode(.inline)
        } // : NavigationView
    }
}

struct PickerBasic_Previews: PreviewProvider {
    static var previews: some View {
        PickerBasic()
    }
}
