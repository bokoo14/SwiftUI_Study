//
//  ContentView.swift
//  STTForTeachers
//
//  Created by Bokyung on 2023/09/24.
//

/**
 상담 일지 관리
 - 바로 녹음을 시작할 수 있는 녹음 버튼 ⭐️
 - STT기능으로 상담 녹취록 작성⭐️
 - 녹음 저장 후 대상 학생 / 상담 종류(학업 / 교우관계 / 진로 등) 수정 기능
 - 학생별 / 사건별(특정 단어) 검색 기능
 - 상담록 내보내기(엑셀 파일) 기능
 - 파일 저장 ⭐️
 - 뷰에서 볼 수 있도록 ⭐️
 - 파일을 선택하면 STT기능을 통해 녹음된 파일을 확인 & Text수정 가능
 */

import SwiftUI
import Speech

struct ContentView: View {
    var body: some View {
        Text("선생님들을 위한 stt 기능을 test합니다^^")
    }
}

#Preview {
    ContentView()
}
