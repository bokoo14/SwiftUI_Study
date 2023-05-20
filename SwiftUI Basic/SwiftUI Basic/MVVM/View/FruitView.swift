//
//  FruitView.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/07.
//

import SwiftUI

struct FruitView: View {
    // @ObservedObject를 사용하여 ViewModel 객체화 하기 -> SubView에서 사용 (부모 View 값을 넘겨 받았을 경우)
    // @ObservedObject var fruitViewModel = FruitViewModel()
    
    // @StateObject 사용하여 ViewModel 객체화하기 -> View가 처음 생성, 초기화할 때, 부모 View에서 주로 사용
    @StateObject var fruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            List{
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack (spacing: 20){
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        } // :HStack
                    }
                } // : Loop
            } // : List
            //                .onAppear{ // 생성될 때 getFruit함수를 먼저 불러옴
            //                    fruitViewModel.getFruit()
            //                }
            .navigationBarItems(trailing: NavigationLink(destination: SecondScreen(fruitViewModel: fruitViewModel),
                                                         label: {
                Image(systemName: "arrow.right")
                    .font(.title)
            }))
            .navigationTitle("과일 리스트")
        }
    }
}

struct SecondScreen: View {
    // property
    @ObservedObject var fruitViewModel = FruitViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // background
            Color.green.ignoresSafeArea()
            
            // foreground
            VStack (spacing: 20) {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .font(.headline)
                        .foregroundColor(.white)
                } // : Loop
                
                // 뒤로 가기 버튼
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("뒤로 가기")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                } // : Button

            } // : VStack
        } // : ZStack
    }
}

struct FruitView_Previews: PreviewProvider {
    static var previews: some View {
        FruitView()
    }
}
