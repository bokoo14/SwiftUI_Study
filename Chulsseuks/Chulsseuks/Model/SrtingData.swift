//
//  SrtingData.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/11.
//

import Foundation

// MARK: 각각의 String Data를 구조화

// Componenet
struct stateComponentString {
    let absence = "결석"
    let late = "지각"
    let attendance = "출석"
}

struct MainButtonString {
    let mainBtn = "출쓱하기"
}

// Main View - CardView
struct CardFrontViewString {
    let image = "character"
    let text1 = "아래 버튼을 눌러\n 오늘의 출쓱을 진행해주세요."
    let text2 = "출석 규정 보러가기 >"
}

struct CardBackViewString {
    let text1 = "한눈에 보는 출석 규정"
    let image = "regulation"
    
}

// Calendar
struct CalendarViewString {
    let log = "출쓱기록"
}

// Dummy Data
struct TabDetailViewString {
    let month = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    let day = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19",  "20","21", "22", "23", "24", "25", "26", "27", "28", "29", "30","31"]
    let duration = ["3/6~4/5", "4/6~5/5", "5/6~6/5", "6/6~7/5", "7/6~8/5", "8/6~9/5", "9/6~10/5", "10/6~11/5", "11/6~12/5"]
    let point: Int
}

struct CalendarModalViewString {
    let text1: String = "출석 인정 범위"
    let text2: String = "출석 : 세션 시작 시간까지 입실(오전 : 9시, 오후 2시)\n지각 : 세션 시작 후 15분까지 입실시\n결석 : 세션 시작 시간 16분 후 이후 입실\n혹은 불참시"
    let text3: String = "출석 점수"
    let text4: String = "지각 3회 혹은 조퇴 2회는 각각 결석 1회로 계산해요.\n앱에서 지각-2점, 조퇴 -3점, 결석- 6 점으로 표기돼요."
    let text5: String = "이번달 출석 점수 기준"
    let text6: String = "이번달 출석 점수는 매달 6일을 기준으로 계산돼요. (예: 3월 6일 ~ 4월 5일) "
    let text7: String = "장학금 지급 및 수료 관련 기준 점수 "
    let text8: String = "매달 출석 점수가 -18점보다 더 낮아지면 해당 달에는 장학금이 지급되지 않아요. 또한 아카데미 전체 기간동안 출석 점수가 -54점 아래로 낮아지게 될 경우, 수료가 불가능할 수 있으니 이점 꼭 유의해주세요."
}
