//
//  CalendarTextDetail.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/05.
//

import SwiftUI

struct CalendarTextDetail: View {
    @Binding var text1: String
    @Binding var text2: String
    
    var body: some View {
        VStack (alignment: .leading){
            Text(text1)
                .foregroundColor(Color.ModalColor)
                .font(.system(.title3, weight: .semibold))
                .padding(1)
            Text(text2)
                .font(.system(.body))
                .lineSpacing(5)
        }
    }
}

struct CalendarTextDetail_Previews: PreviewProvider {
    static var previews: some View {
        CalendarTextDetail(text1: .constant("출석 인정 범위"), text2: .constant("출석 : 세션 시작 시간까지 입실(오전 : 9시, 오후 2시)\n지각 : 세션 시작 후 15분까지 입실시\n결석 : 세션 시작 시간 16분 후 이후 입실\n혹은 불참시"))
    }
}
