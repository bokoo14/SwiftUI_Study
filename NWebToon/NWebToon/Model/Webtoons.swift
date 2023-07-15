//
//  Webtoons.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/15.
//

import Foundation

struct WebToons: Identifiable {
    var id: UUID = UUID()
    var imageName: String
    var imageTitle: String
    var imageDetail: String
}


var mondayWebToons: [WebToons] = [
    WebToons(imageName: "ImgContentMon01", imageTitle: "그냥 선생님", imageDetail: "엠케이 ★9.99"),
    WebToons(imageName: "ImgContentMon02", imageTitle: "멸망급 ADA의 선생님", imageDetail: "엠케이 ★9.99"),
    WebToons(imageName: "ImgContentMon03", imageTitle: "엠케이가 간다!", imageDetail: "엠케이 ★9.99"),
    
    WebToons(imageName: "ImgContentMon04", imageTitle: "아이들의 엠선생님", imageDetail: "엠케이 ★9.99"),
    WebToons(imageName: "ImgContentMon05", imageTitle: "엠케이의 교실", imageDetail: "엠케이 ★9.99"),
    WebToons(imageName: "ImgContentMon06", imageTitle: "공부의 결과", imageDetail: "엠케이 ★9.99"),
    
    WebToons(imageName: "ImgContentMon07", imageTitle: "공부를 뇌에서 뽑으면", imageDetail: "엠케이 ★9.99"),
    WebToons(imageName: "ImgContentMon08", imageTitle: "공부하기 좋은 날", imageDetail: "엠케이 ★9.99"),
    WebToons(imageName: "ImgContentMon09", imageTitle: "초월자 학원의 수강생이 되었다.", imageDetail: "엠케이 ★9.99"),
    
    WebToons(imageName: "ImgContentMon10", imageTitle: "애플까지 걸어서 1분", imageDetail: "엠케이 ★9.99"),
    WebToons(imageName: "ImgContentMon11", imageTitle: "스터디 그룹", imageDetail: "엠케이 ★9.99"),
    WebToons(imageName: "ImgContentMon12", imageTitle: "지금 우리 학교는", imageDetail: "엠케이 ★9.99")
]

var tuesdayWebToons: [WebToons] = [
    WebToons(imageName: "ImgContentTue01", imageTitle: "놓았다! 정신줄!", imageDetail: "김래원 ★9.78"),
    WebToons(imageName: "ImgContentTue02", imageTitle: "외모지하주의", imageDetail: "김래원 ★9.78"),
    WebToons(imageName: "ImgContentTue03", imageTitle: "하남자", imageDetail: "김래원 ★9.78"),
    
    WebToons(imageName: "ImgContentTue04", imageTitle: "광마회귀", imageDetail: "김래원 ★9.78"),
    WebToons(imageName: "ImgContentTue05", imageTitle: "절대복종", imageDetail: "김래원 ★9.78"),
    WebToons(imageName: "ImgContentTue06", imageTitle: "나혼자 쪼렙", imageDetail: "김래원 ★9.78"),
    
    WebToons(imageName: "ImgContentMon07", imageTitle: "개(를) 빻았다", imageDetail: "김래원 ★9.78"),
    WebToons(imageName: "ImgContentTue08", imageTitle: "선을 넘은 김래원", imageDetail: "김래원 ★9.78"),
    WebToons(imageName: "ImgContentTue09", imageTitle: "이십팔세기", imageDetail: "김래원 ★9.78"),
    
    WebToons(imageName: "ImgContentTue10", imageTitle: "아카데미 탈출일지", imageDetail: "김래원 ★9.78"),
    WebToons(imageName: "ImgContentTue11", imageTitle: "유쾌한 왕따", imageDetail: "김래원 ★9.78"),
    WebToons(imageName: "ImgContentTue12", imageTitle: "세기말 풋사과 보습학원", imageDetail: "김래원 ★9.78")
]

var wednesdayWebToons: [WebToons] = [
    WebToons(imageName: "ImgContentWed01", imageTitle: "근육귀환", imageDetail: "김래원 ★9.78"),
    WebToons(imageName: "ImgContentWed02", imageTitle: "성스러운 헬창생활", imageDetail: "김래원 ★9.78"),
    WebToons(imageName: "ImgContentWed03", imageTitle: "전지적 채드기준", imageDetail: "김래원 ★9.78"),
    
    WebToons(imageName: "ImgContentWed04", imageTitle: "근육연애", imageDetail: "김래원 ★9.78"),
    WebToons(imageName: "ImgContentWed05", imageTitle: "내가 키운 근육들", imageDetail: "김래원 ★9.78"),
    WebToons(imageName: "ImgContentWed06", imageTitle: "시한부 만들뻔 했어요!", imageDetail: "김래원 ★9.78"),
    
    WebToons(imageName: "ImgContentWed07", imageTitle: "근육을 훔친 이는 누구인가", imageDetail: "머슬러닝 ★9.78"),
    WebToons(imageName: "ImgContentWed08", imageTitle: "백세트", imageDetail: "머슬러닝 ★9.78"),
    WebToons(imageName: "ImgContentWed09", imageTitle: "내가 운동을 결심한 것은", imageDetail: "머슬러닝 ★9.78"),
    
    WebToons(imageName: "ImgContentWed10", imageTitle: "맞짱깔래?", imageDetail: "머슬러닝 ★9.78"),
    WebToons(imageName: "ImgContentWed11", imageTitle: "66666년 만에 환생한 흑마법사", imageDetail: "머슬러닝 ★9.78"),
    WebToons(imageName: "ImgContentWed12", imageTitle: "헬창2", imageDetail: "머슬러닝 ★9.78")
]

var thursdayWebToons: [WebToons] = [
    WebToons(imageName: "ImgContentThu01", imageTitle: "시대장", imageDetail: "김시즈 ★9.83"),
    WebToons(imageName: "ImgContentThu02", imageTitle: "마루는 강쥐", imageDetail: "김시즈 ★9.83"),
    WebToons(imageName: "ImgContentThu03", imageTitle: "하루만 시즈가 되고 싶어", imageDetail: "김시즈 ★9.83"),
    
    WebToons(imageName: "ImgContentThu04", imageTitle: "유사연애", imageDetail: "김시즈 ★9.83"),
    WebToons(imageName: "ImgContentThu05", imageTitle: "내가 짜온 개발코드", imageDetail: "김시즈 ★9.83"),
    WebToons(imageName: "ImgContentThu06", imageTitle: "시한부인 줄 알았어요!", imageDetail: "김시즈 ★9.83"),
    
    WebToons(imageName: "ImgContentThu07", imageTitle: "사신소년", imageDetail: "김시즈 ★9.83"),
    WebToons(imageName: "ImgContentThu08", imageTitle: "대학원 탈출일지", imageDetail: "김시즈 ★9.83"),
    WebToons(imageName: "ImgContentThu09", imageTitle: "한림 체육관", imageDetail: "김시즈 ★9.83"),
    
    WebToons(imageName: "ImgContentThu10", imageTitle: "멸망 이후의 세계", imageDetail: "김시즈 ★9.83"),
    WebToons(imageName: "ImgContentThu11", imageTitle: "올가미", imageDetail: "김시즈 ★9.83"),
    WebToons(imageName: "ImgContentThu12", imageTitle: "하복팽가 막내아들", imageDetail: "김시즈 ★9.83")
]

var fridayWebToons: [WebToons] = [
    WebToons(imageName: "ImgContentFri01", imageTitle: "버림받은 왕녀의 은밀한 침실", imageDetail: "꽃사슴보이 ★9.99"),
    WebToons(imageName: "ImgContentFri02", imageTitle: "제이의 세계", imageDetail: "꽃사슴보이 ★9.99"),
    WebToons(imageName: "ImgContentFri03", imageTitle: "백수세끼", imageDetail: "꽃사슴보이 ★9.99"),
    
    WebToons(imageName: "ImgContentFri04", imageTitle: "뷰티풀 군바리", imageDetail: "꽃사슴보이 ★9.99"),
    WebToons(imageName: "ImgContentFri05", imageTitle: "알고지상주의", imageDetail: "꽃사슴보이 ★9.99"),
    WebToons(imageName: "ImgContentFri06", imageTitle: "물어보는 사이", imageDetail: "꽃사슴보이 ★9.99"),
    
    WebToons(imageName: "ImgContentFri07", imageTitle: "개발신의탑", imageDetail: "꽃사슴보이 ★9.99"),
    WebToons(imageName: "ImgContentFri08", imageTitle: "똑닮은딸", imageDetail: "꽃사슴보이 ★9.99"),
    WebToons(imageName: "ImgContentFri09", imageTitle: "윈드 브레이커", imageDetail: "꽃사슴보이 ★9.99"),
    
    WebToons(imageName: "ImgContentFri10", imageTitle: "장씨세가 호위무사", imageDetail: "꽃사슴보이 ★9.99"),
    WebToons(imageName: "ImgContentFri11", imageTitle: "순정말고 순종", imageDetail: "꽃사슴보이 ★9.99"),
    WebToons(imageName: "ImgContentFri12", imageTitle: "신화급 귀속 아이템을 손에 넣었다", imageDetail: "꽃사슴보이 ★9.99")
]


var SaturdayWebToons: [WebToons] = [
    WebToons(imageName: "ImgContentSat01", imageTitle: "잪집에는 로꼬 살고 있다", imageDetail: "로꼬 ★9.78"),
    WebToons(imageName: "ImgContentSat02", imageTitle: "알고 일기", imageDetail: "로꼬 ★9.78"),
    WebToons(imageName: "ImgContentSat03", imageTitle: "페페를 죽여줘요", imageDetail: "로꼬 ★9.78"),
    
    WebToons(imageName: "ImgContentSat04", imageTitle: "알고머신", imageDetail: "로꼬 ★9.78"),
    WebToons(imageName: "ImgContentSat05", imageTitle: "촉법소년", imageDetail: "로꼬 ★9.78"),
    WebToons(imageName: "ImgContentSat06", imageTitle: "재벌집 막내아들", imageDetail: "로꼬 ★9.78"),
    
    WebToons(imageName: "ImgContentSat07", imageTitle: "수학을 삼킨 너에게", imageDetail: "로꼬 ★9.78"),
    WebToons(imageName: "ImgContentSat08", imageTitle: "뮤즈 온 유명", imageDetail: "로꼬 ★9.78"),
    WebToons(imageName: "ImgContentSat09", imageTitle: "코딩 테스트", imageDetail: "로꼬 ★9.78"),
    
    WebToons(imageName: "ImgContentSat10", imageTitle: "가족같은 XX", imageDetail: "로꼬 ★9.78"),
    WebToons(imageName: "ImgContentSat11", imageTitle: "순수한 동거생활", imageDetail: "로꼬 ★9.78"),
    WebToons(imageName: "ImgContentSat12", imageTitle: "나 혼자 네크로맨서", imageDetail: "로꼬 ★9.78")
]


var SundayWebToons: [WebToons] = [
    WebToons(imageName: "ImgContentSun01", imageTitle: "김다빈형님", imageDetail: "김다빈 ★9.88"),
    WebToons(imageName: "ImgContentSun02", imageTitle: "숙제 안해오면 몽둥이", imageDetail: "김다빈 ★9.88"),
    WebToons(imageName: "ImgContentSun03", imageTitle: "김다빈, 전설이 되다", imageDetail: "김다빈 ★9.88"),
    
    WebToons(imageName: "ImgContentSun04", imageTitle: "나랑 Xcode 할래?", imageDetail: "김다빈 ★9.88"),
    WebToons(imageName: "ImgContentSun05", imageTitle: "세레나", imageDetail: "김다빈 ★9.88"),
    WebToons(imageName: "ImgContentSun06", imageTitle: "프리드로우", imageDetail: "김다빈 ★9.88"),
    
    WebToons(imageName: "ImgContentSun07", imageTitle: "흑화한 김다빈은 무섭다", imageDetail: "김다빈 ★9.88"),
    WebToons(imageName: "ImgContentSun08", imageTitle: "망나니 소교주로 환생했다", imageDetail: "김다빈 ★9.88"),
    WebToons(imageName: "ImgContentSun09", imageTitle: "작전명 순정", imageDetail: "김다빈 ★9.88"),
    
    WebToons(imageName: "ImgContentSun10", imageTitle: "마도 전생기", imageDetail: "김다빈 ★9.88"),
    WebToons(imageName: "ImgContentSun11", imageTitle: "대충해도 코딩 잘함", imageDetail: "김다빈 ★9.88"),
    WebToons(imageName: "ImgContentSun12", imageTitle: "나를 바꿔줘", imageDetail: "김다빈 ★9.88")
]


var NewWebToons: [WebToons] = [
    WebToons(imageName: "ImgContentNew01", imageTitle: "신혼일기", imageDetail: "하명관 ★9.78"),
    WebToons(imageName: "ImgContentNew02", imageTitle: "싸움못함", imageDetail: "하명관 ★9.78"),
    WebToons(imageName: "ImgContentNew03", imageTitle: "퇴학용병", imageDetail: "하명관 ★9.78"),
    
    WebToons(imageName: "ImgContentNew04", imageTitle: "약한 하명관", imageDetail: "하명관 ★9.78"),
    WebToons(imageName: "ImgContentNew05", imageTitle: "치매전쟁", imageDetail: "하명관 ★9.78"),
    WebToons(imageName: "ImgContentNew06", imageTitle: "투신 잔챙이", imageDetail: "하명관 ★9.78"),
    
    WebToons(imageName: "ImgContentNew07", imageTitle: "사형 하명관", imageDetail: "하명관 ★9.78"),
    WebToons(imageName: "ImgContentNew08", imageTitle: "일타강사 하사부", imageDetail: "하명관 ★9.78"),
    WebToons(imageName: "ImgContentNew09", imageTitle: "소녀재판", imageDetail: "하명관 ★9.78"),
    
    WebToons(imageName: "ImgContentNew10", imageTitle: "무직백수 하 명 관", imageDetail: "하명관 ★9.78"),
    WebToons(imageName: "ImgContentNew11", imageTitle: "사랑받는 시집살이", imageDetail: "하명관 ★9.78"),
    WebToons(imageName: "ImgContentNew12", imageTitle: "고백 받을 수 있긴 하나?", imageDetail: "하명관 ★9.78")
]
