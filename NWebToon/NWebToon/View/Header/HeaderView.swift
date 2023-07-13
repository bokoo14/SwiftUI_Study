//
//  HeaderView.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/12.
//

import SwiftUI

struct HeaderView: View {
    @State var currentIndex: Int = 0
    
    @GestureState var offset: CGFloat = 0
    
    // index가 1일때는 왼쪽 16만큼 보임, 오른쪽 spacing 10, 오른쪽에 보이는 것 6
    // index가 2이상일때는 왼쪽 오른쪽 10만큼 spacing, 오른쪽 왼쪽에 보이는 부분 6
    // 16 카드 10 6
    // 6 10 카드 10 6
    let leftrightSpacing: CGFloat = 10 // 배너 좌우 하나의 공백
    let totalSpacing: CGFloat = 32 // 배너를 제외한 나머지의 공백
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width // 전체 width
            //let adjustmentWidth = (width/2) - leftrightSpacing // 첫번째 index일때 왼쪽에 spacing을 추가적으로 더해줌 -> 피그마에서는 6임
            let adjustmentWidth = 6
            ZStack (alignment: .bottom){
                HStack(spacing: 0){
                    ForEach(1..<8) { index in
                        Image("ImgBanner0"+"\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width) // 화면 전체를 차지
                        //.frame(width: 393, height: 250)
                    } // ForEach
                } // HStack
                .offset(x: CGFloat(currentIndex)*(-width) + offset) // offset
                
                HStack(spacing: 10){
                    ForEach(1..<8) { index in
                        Image("ImgLineBanner0"+"\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width - totalSpacing) // 화면 전체 - 전체 공백
                    } // ForEach
                } // HStack
                .offset(x: CGFloat(currentIndex)*(-width) + (currentIndex == 0 ? adjustmentWidth : 0) + offset) // offset
            } // ZStack
            .gesture(
                DragGesture()
                // updating: DragGesture를 하는 도중에 발생하는 event
                //.updating(<#T##state: GestureState<State>##GestureState<State>#>, body: <#T##(DragGesture.Value, inout State, inout Transaction) -> Void#>)
                // value에는 여러 값이 있고, 그 값을 활용 -> 예: translation과 같은 값을 가지고 있음
                // inoutState의 값은 앞에 있는 state의 값과 동일한 변수
                    .updating($offset, body: { dragGestureValue, inoutState, inoutTransaction in
                        inoutState = dragGestureValue.translation.width
                    })
                // onChanged: 변화가 있으면 실행해라
                // value: value.startLocation같은 많은 것들이 들어있다
                    .onChanged({ value in })
                // 손을 뗐을때 실행됨
                // 마지막 값을 갖고 싶을때
                // value: value.startLocation같은 많은 것들이 들어있다
                    .onEnded { value in
                        // draw gesture로 변화된 width값
                        let widthOffset = value.translation.width
                        let howSwap = -widthOffset / width
                        let isNextIndex = howSwap.rounded()
                        
                        currentIndex = max(min(currentIndex+Int(isNextIndex), 8), 0)
                    }
            ) // gesture
            
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
