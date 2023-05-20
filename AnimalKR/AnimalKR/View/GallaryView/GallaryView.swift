//
//  GallaryView.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/24.
//

import SwiftUI

struct GallaryView: View {
    // property
    @ObservedObject var vm: AnimalViewModel
    
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false){
                VStack (spacing: 30){
                    
                    // 1. Image
                    Image(vm.selectedAnimal)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                        .overlay (
                            Circle()
                                .stroke(Color.accentColor, lineWidth: 5)
                        )
                    
                    // 2. Slider
                    Slider(value: $vm.gridColumn, in: 2...4, step: 1)
                        .padding(0)
                        .onChange(of: vm.gridColumn) { value in
                            withAnimation(Animation.easeInOut(duration: 1.0)) {
                                vm.gridSwitch()
                            }
                        }
                    
                    // 3. Grid
                    LazyVGrid(columns: vm.gridLayout, spacing: 20) {
                        ForEach(vm.animals) { animal in
                            Image(animal.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            // 작은 이미지를 클릭하면 큰 이미지가 그것으로 변경될 수 있도록
                                .onTapGesture {
                                    withAnimation(Animation.spring()) {
                                        vm.selectedAnimal = animal.image
                                    }
                                }
                        } // :ForEach
                    } // : LazyVGrid
                    
                } // :VStack
                .padding()
                
            } // :ScrollView
            .navigationTitle("갤러리")
            .navigationBarTitleDisplayMode(.inline)
        } // :Navigation
    }
}

struct GallaryView_Previews: PreviewProvider {
    static var previews: some View {
        GallaryView(vm: AnimalViewModel())
    }
}
