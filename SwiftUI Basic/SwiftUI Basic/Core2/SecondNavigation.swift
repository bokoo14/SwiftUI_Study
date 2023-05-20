//
//  SecondNavigation.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/07.
//

import SwiftUI

struct SecondNavigation: View {
    
    // property
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // background
            Color.green.ignoresSafeArea()
            
            VStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("이전 페이지로 이동")
                        .foregroundColor(.green)
                        .font(.headline)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                } // : Button
                
                NavigationLink {
                    //  destination
                    ZStack {
                        Color.blue.ignoresSafeArea()
                        Text("3번째 페이지 입니다")
                            .font(.headline)
                    }
                } label: {
                    Text("3번째 페이지로 이동")
                        .foregroundColor(.green)
                        .font(.headline)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                } // : NavigationLink

                
            } // VStack
        } // : ZStack
        
    }
}

struct SecondNavigation_Previews: PreviewProvider {
    static var previews: some View {
        // Preview에서 확인하고 싶다면 NavigationView를 추가
        NavigationView {
            SecondNavigation()
        }
    }
}
