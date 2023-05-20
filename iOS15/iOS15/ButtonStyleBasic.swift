//
//  ButtonStyleBasic.swift
//  iOS15
//
//  Created by Bokyung on 2023/04/29.
//

import SwiftUI

struct ButtonStyleBasic: View {
    /**
     ButtonStyle: 애플에 기본적으로 저장되어 있는 버튼 스타일을 가져와서 사용할 수 있음
     */
    var body: some View {
        // 1. 일반적인 ButtonStyle - plain, bordered, borderedProminent, borderless
        ScrollView {
            VStack (spacing: 20){
                Text("1. 일반적인 ButtonStyle")
                    .font(.headline)
                
                // : Plain Button
                Button {
                    // action
                } label: {
                    Text("Plain ButtonStyle")
                }
                .frame(height: .infinity)
                .frame(maxWidth: .infinity)
                .buttonStyle(.plain)
                
                // : Border Button
                Button {
                    // action
                } label: {
                    Text("bordered buttonStyle")
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .buttonStyle(.bordered)
                
                // : BorderProminent Button
                Button {
                    // action
                } label: {
                    Text("BorderedProminent ButtonStyle")
                }
                .frame(height: .infinity)
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                
                // : Borderless Button
                Button {
                    // action
                } label: {
                    Text("borderless ButtonStyle")
                }
                .frame(height: .infinity)
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderless)
            } // :VStack
            .padding()
            
            
            Divider()
            
            
            // 2. Controll Size로 버튼 크기 자동 설정 - large, regular, small, mini
            VStack (spacing: 20){
                Text("2. Controll Size로 버튼 크기 자동 설정")
                    .font(.headline)
                
                // large controllsize
                Button {
                    // action
                } label: {
                    Text("large controllSize")
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)

                // regular controllsize
                Button {
                    // action
                } label: {
                    Text("regular controllSize")
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)

                
                // small controllsize
                Button {
                    // action
                } label: {
                    Text("small controllSize")
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .controlSize(.small)
                
                // mini controllsize
                Button {
                    // action
                } label: {
                    Text("mini controllSize")
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .controlSize(.mini)
            } // :VStack
            .padding()
            
        } // :Scroll
    }
}

struct ButtonStyleBasic_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBasic()
    }
}
