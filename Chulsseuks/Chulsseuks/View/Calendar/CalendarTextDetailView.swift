//
//  CalendarTextDetail.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/05.
//

import SwiftUI

struct CalendarTextDetail: View {
    @State var text1: String
    @State var text2: String
    
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
        CalendarTextDetail(text1: CalendarModalViewString().text1, text2: CalendarModalViewString().text2)
    }
}
