//
//  CalendarModalView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/04.
//

import SwiftUI

struct CalendarModalView: View {
    // modal뷰를 제거하는 변수
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        // MARK: spacing을 잡을때 Spacer로 잡는게 좋을까 or frame으로 잡는게 좋을까 or padding을 주는게 좋을까?
        ScrollView{
            VStack (alignment: .leading) {
                // X버튼
                HStack {
                    Spacer()
                    Button {
                        // action - 띄워져있던 모달뷰를 제거
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .foregroundColor(.black)
                    }
                }
                
                Text("아카데미 출석 규정")
                    .font(.system(.title, weight: .semibold))
                Spacer()
                    .frame(height: 60)
                
                CalendarTextDetail(text1: CalendarModalViewString().text1, text2: CalendarModalViewString().text2)
                Spacer()
                    .frame(height: 30)
                CalendarTextDetail(text1: CalendarModalViewString().text3, text2: CalendarModalViewString().text4)
                Spacer()
                    .frame(height: 30)
                CalendarTextDetail(text1: CalendarModalViewString().text5, text2: CalendarModalViewString().text6)
                Spacer()
                    .frame(height: 30)
                CalendarTextDetail(text1: CalendarModalViewString().text7, text2: CalendarModalViewString().text8)
                
            } //: VStack
            .padding(25)
        }
        
    }
}

struct CalendarModalView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarModalView()
    }
}
