//
//  CalendarModalView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/04.
//

import SwiftUI

struct CalendarModalView: View {
    var text1: String = "출석 인정 범위"
    var text2: String = "출석 : 세션 시작 시간까지 입실(오전 : 9시, 오후 2시)\n지각 : 세션 시작 후 15분까지 입실시\n결석 : 세션 시작 시간 16분 후 이후 입실\n혹은 불참시"
    var text3: String = "출석 점수"
    var text4: String = "지각 3회 혹은 조퇴 2회는 각각 결석 1회로 계산해요.\n앱에서 지각-2점, 조퇴 -3점, 결석- 6 점으로 표기돼요."
    var text5: String = "이번달 출석 점수 기준\n 이번달 출석 점수는 매달 6일을 기준으로 계산돼요. (예: 3월 6일 ~ 4월 5일) "
    var text6: String = "장학금 지급 및 수료 관련 기준 점수 "
    var text7: String = "매달 출석 점수가 -18점보다 더 낮아지면 해당 달에는 장학금이 지급되지 않아요. 또한 아카데미 전체 기간동안 출석 점수가 -54점 아래로 낮아지게 될 경우, 수료가 불가능할 수 있으니 이점 꼭 유의해주세요."
    
    var body: some View {
        VStack (alignment: .leading){
            // content
            Text("아카데미 출석 규정")
                .font(.headline)
            Spacer()
                .frame(height: 60)
            
            Text(text1)
                .foregroundColor(.indigo)
            Text(text2)
            Text(text3)
            Text(text4)
            Text(text5)
            Text(text6)
            Text(text7)
            
            
        }
        .padding()
    }
}

struct CalendarModalView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarModalView()
    }
}
