//
//  CustomList.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/13.
//

import SwiftUI

struct CustomList: View {
    @State var month: String
    @State var duration: String
    @State var date: String
    @State var point: String
    
    var body: some View {
        List {
            HStack{
                Text(month)
                    .font(.system(size: 23, weight: .medium))
                Text(duration)
                    .font(.system(size: 23))
                    .foregroundColor(.gray)
                Spacer()
                Text(point)
                    .font(.system(size: 23, weight: .medium))
            }
            .padding(.vertical)
            
            HStack{
                // MARK: 원래의 logic - if문을 사용해서 지각, 결석, 출석 체크
                absenceComponent()
                Text(date)
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                Spacer()
                Text(point)
                    .font(.system(size: 18))
            }
            // 각각의 리스트의 요소에 색을 칠해준다
            //.listRowBackground(Color.green)
            
        } // List
        // .scrollContentBackground(.hidden) modifier를 사용해서 List의 표준 배경을 숨긴다.
        // 새로운 배경색을 설정한다.
        .scrollContentBackground(.hidden)
        .background(Color("backgroundColor").ignoresSafeArea())
        
    }
}

struct CustomList_Previews: PreviewProvider {
    static var previews: some View {
        CustomList(month: "5월", duration: "(5/6~6/5", date: "5/15", point: "-6점")
    }
}
