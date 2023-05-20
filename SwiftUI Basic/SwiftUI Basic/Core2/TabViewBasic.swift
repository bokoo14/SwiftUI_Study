//
//  TabViewBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/23.
//

import SwiftUI

struct TabViewBasic: View {
    // property
    @State var initPageNumber: Int = 0
    
    var body: some View {
        TabView(selection: $initPageNumber) {
            HomeView(selectedTab: $initPageNumber)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            Text("둘러보기 화면")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .tag(1)
            
            Text("프로필 화면")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        } //: TabView
        .tint(.red)
        
    }
}

struct TabViewBasic_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBasic()
    }
}


// HomeView
struct HomeView: View {
    // 위의 값을 가져오려면 Binding을 써야 함
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            // background
            Color.red.edgesIgnoringSafeArea(.top)
            
            // foreground
            VStack (spacing: 20) {
                Text("홈화면")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Button {
                    selectedTab = 2
                } label: {
                    Text("프로필 화면 이동")
                        .font(.headline)
                        .padding(20)
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(10)
                } // : Button
            } // : VStack
            
        } // : ZStack
    }
}
