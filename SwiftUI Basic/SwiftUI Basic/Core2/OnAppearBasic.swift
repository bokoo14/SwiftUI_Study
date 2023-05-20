//
//  OnAppearBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/23.
//

import SwiftUI

struct OnAppearBasic: View {
    // property
    @State var noticeText: String = "onAppear 시작 전"
    @State var count: Int = 0
    
    /**
     onAppear: 인터넷으로 데이터를 가져올때 양이 많다면 load로 인해 앱이 정체되는 상황이 발생할 수도 있다
     이때 onAppear를 사용하여 특정 뷰가 화면에 나타날때 data를 fetch하는 이벤트를 실행하면 한번에 load되는 것을 방지할 수 있음
     */
    var body: some View {
        NavigationView {
            ScrollView {
                Text(noticeText)
                
                // 화면이 보이고 나서 load가 되게끔 하는 LazyStack
                LazyVStack {
                    // 50개의 직사각형 박스 만들기
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 200)
                            .padding()
                        // onAppear: 새로 화면에 생길때 마다 count 1씩 증가시키기
                            .onAppear {
                                count += 1
                            }
                    } // : ForEach
                } // : LazyVStack
            } // : Scroll
            // : onAppear: 여기서 onAppearBasic View가 화면에 나타날 때 시작되는 logic 넣기
            .onAppear{
                // dispatchQueue를 사용해서 main thread에 2초 딜레이 후 이벤트 실행
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    noticeText = "onAppear 시작 완료 했습니다"
                }
            }
            .navigationTitle("생성된 박스: \(count)")
        } // : Navigation
        
    }
}

struct OnAppearBasic_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearBasic()
    }
}
