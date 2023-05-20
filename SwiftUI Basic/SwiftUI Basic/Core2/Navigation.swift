//
//  Navigation.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/07.
//

import SwiftUI

struct Navigation: View {
    // NavigationView: 네비게이션 스택을 사용, 다른 화면으로 전환
    // NavigationLink: event 또는 특정 조건 만족 시 지정한 목적지로 이동 버튼
    
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    // destination: 목적지 -> 어디로 페이지 이동할거냐
                    SecondNavigation()
                } label: {
                    Text("Second Navigation 이동")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                }
            } // : VStack
            // navigationTitle - 상단에 페이지 제목
            .navigationTitle("페이지 제목")
            
            // navigationBarTitleDisplayMode
            // .automatic: 자동, inline: 상단에 작게, large: leading쪽으로 크게
            .navigationBarTitleDisplayMode(.inline)
            
            // navigationBarHidden - 네비게이션 타이틀, 바를 감춤
            //.navigationBarHidden(true)
            
            .toolbar {
                Image(systemName: "line.3.horizontal")
                Spacer()
                Button {
                    showSheet.toggle()
                } label: {
                    Image(systemName: "gear")
                }
            } // toolbar
            
            .sheet(isPresented: $showSheet) {
                ZStack {
                    // background
                    Color.green.ignoresSafeArea()
                    
                    // content
                    Text("설정 페이지 입니다")
                        .font(.largeTitle)
                }
            }
            
        } // : NavigationView
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
