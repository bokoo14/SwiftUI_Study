//
//  onTapGuestureBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/23.
//

import SwiftUI

struct onTapGuestureBasic: View {
    /**
     onTabGuesture: 버튼 값이 아닌, 이미지나 텍스트를 클릭할 때 이벤트가 실행
     버튼과 다르게 사용자가 클릭하는 숫자를 변경할 수 있음
     한번 클릭했을때는 실행되지 않지만, 2번 3번 클릭하면 실행되도록 변경할 수 있음
     */
    
    // property
    @State var isSelected: Bool = false
    var body: some View {
        VStack (spacing: 40) {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(height: 200)
                .foregroundColor(isSelected ? .green : .red)
            
            // 1. 일반적인 Button
            Button {
                isSelected.toggle()
            } label: {
                Text("1. 일반적인 Button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(25)
            }
            
            // 2. onTapGuesture
            Text("2. onTapGuesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(25)
                .onTapGesture {
                    isSelected.toggle()
                }
            
            // 3. custom onTapGuesture - 두번 클릭 시 실행
            Text("3. custom onTapGuesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(25)
                .onTapGesture(count: 2) {
                    isSelected.toggle()
                }
            
            
            Spacer()

        } // : VStack
        .padding()
    }
}

struct onTapGuestureBasic_Previews: PreviewProvider {
    static var previews: some View {
        onTapGuestureBasic()
    }
}
