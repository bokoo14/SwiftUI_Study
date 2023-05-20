//
//  ContentView.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/24.
//

import SwiftUI

struct ContentView: View {
    
    // property
    @ObservedObject var vm: AnimalViewModel
    
    var body: some View {
        NavigationView {
            List {
                // 1. Cover Image - hero Image
                CoverImageView(vm: vm)
                    .frame(height: CGFloat.screenHeight * 0.4)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)) // 리스트의 이미지가 화면에 얼마나 떨어질 것인지
                
                // 2. Animal List
                ForEach(vm.animals) { animal in
                    NavigationLink {
                        // destination
                        DetailView(animal: animal)
                    } label: {
                        // list label
                        AnimalListView(animal: animal)
                            .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                    } // :NavigationLink
                } // : ForEach
                
                // 3. Credit
                CreditView()
                    .hCenter()
                
            } // :List
            .listStyle(.plain) // 화면에 가득차게 됨
            .navigationTitle("멸종위기 동물들")
        } // : Navigation
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: AnimalViewModel())
    }
}
