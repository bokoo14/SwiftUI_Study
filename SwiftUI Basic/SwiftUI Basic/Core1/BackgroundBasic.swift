//
//  BackgroundBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/09.
//

import SwiftUI

struct BackgroundBasic: View {
    // .background: 대상의 뒷배경 설정
    // .overlay: 대상의 앞배경 설정
    
    var body: some View {
        // 1. background
        VStack (spacing: 20){
            Text("Hello world")
                .frame(width: 100, height: 100)
                .background(
                    Circle()
                        .fill(LinearGradient(colors: [.red, .blue],
                                            startPoint: .leading,
                                             endPoint: .trailing)
                        )
                )
                .frame(width: 120, height: 120)
                .background(
                    Circle()
                        .fill(.purple)
            )
            Divider()
            
            // 2. Overlay
            Circle()
                .fill(.pink)
                .frame(width: 100, height: 100)
                .overlay(
                Text("overlay")
                    .font(.title)
                    .foregroundColor(.white)
                )
                .background(
                    Circle()
                        .fill(.blue)
                        .frame(width: 120, height: 120)
                )
            Divider()
            
            // 3. Background and overlay
            Rectangle()
                .frame(width: 200, height: 200)
                .overlay(
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 100, height: 100)
                    , alignment: .leading
                )
                .background(
                    Rectangle()
                        .fill(.red)
                        .frame(width: 250, height: 250)
                )
                .padding()
            Divider()
            
            // 4. Custom App Icon
            Image(systemName: "heart.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .background(
                    Circle()
                        .fill(
                            LinearGradient(colors: [.cyan, .blue], startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(width: 100, height: 100)
                        .shadow(color: .blue, radius: 10, x: 0, y: 10)
                        .overlay(
                            Circle()
                                .fill(.red)
                                .frame(width: 35, height: 35)
                                .overlay(
                                    Text("2")
                                        .foregroundColor(.white)
                                )
                                .shadow(color: .red, radius: 10, x: 5, y: 5)
                            , alignment: .bottomTrailing
                        )
                )
                .padding(30)
        } // : VStack
    }
}

struct BackgroundBasic_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundBasic()
    }
}
