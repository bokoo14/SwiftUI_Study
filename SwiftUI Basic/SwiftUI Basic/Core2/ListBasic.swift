//
//  ListBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/07.
//

import SwiftUI

struct ListBasic: View {
    // property
    @State var fruits: [String] = [
        "사과", "오렌지", "바나나", "수박"
    ]
    
    @State var meats: [String] = [
        "소고기", "돼지고기", "닭고기"
    ]
    
    // 리스트를 삭제하는 함수
    func delete (indexSet: IndexSet){
        fruits.remove(atOffsets: indexSet)
    }
    
    // 리스트를 이동하는 함수
    func move (indices: IndexSet, newOffset: Int) {
        // 처음 값 ~ 이동할 값
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    // 고기 종류 리스트를 삭제하는 함수
    func deleteMeats (indexSet: IndexSet) {
        meats.remove(atOffsets: indexSet)
    }
    
    // 고기 종류 리스트를 이동하는 함수
    func moveMeats (indices: IndexSet, newOffset: Int) {
        // 처음값 ~ 이동할 값
        meats.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    // 값을 추가하는 뷰
    var addButton: some View {
        Button {
            fruits.append("딸기")
        } label: {
            Text("Add")
        }

    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit)
                            .font(.body)
                            .foregroundColor(.white)
                            .padding(.vertical)
                    }
                    .onDelete(perform: delete) // 삭제 기능
                    .onMove(perform: move) // 이동 기능
                    .listRowBackground(Color.brown) // 리스트의 색깔 지정
                } header: {
                    Text("과일종류")
                        .font(.headline)
                        .foregroundColor(.brown)
                } // : Section
                
                Section {
                    //content
                    ForEach(meats, id: \.self) { meat in
                        Text(meat)
                            .font(.body)
                            .foregroundColor(.white)
                            .padding(.vertical)
                    }
                    .onDelete(perform: deleteMeats)
                    .onMove(perform: moveMeats)
                    .listRowBackground(Color.green)
                    
                } header: {
                    Text("고기종류")
                        .font(.headline)
                        .foregroundColor(.green)
                } // : Section

                
            } // :List
            .navigationTitle("우리 동네 마트")
            .navigationBarTitleDisplayMode(.inline) // navigationTitle을 어떻게 보여줄지
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    addButton
                }
            } // : toolbar - navigationBarItems(leading: EditButton(), trailing: addButton)과 동일
        } // :NavigationView
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListBasic()
    }
}
