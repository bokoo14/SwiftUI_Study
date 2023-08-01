//
//  HeaderView.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/12.
//

import SwiftUI

struct HeaderView: View {
    /*
     [Note]
     CGFloat: width, height
     CGPoint: x, y 좌표
     CGRect: CGFloat + CGPoint
     */
    @State var currentIndex: Int = 0
    
    @GestureState var dragOffset: CGFloat = 0 // 실시간으로 얼마만큼 이동했는지
    
    // index가 1일때는 왼쪽 16만큼 보임, 오른쪽 spacing 10, 오른쪽에 보이는 것 6
    // index가 2이상일때는 왼쪽 오른쪽 10만큼 spacing, 오른쪽 왼쪽에 보이는 부분 6
    // index가 1일때: 16 카드 10 6
    // index가 2이상일때: 6 10 카드 10 6
    let leftrightSpacing: CGFloat = 10 // 배너 좌우 공백
    let totalSpacing: CGFloat = 32 // 배너를 제외한 전체 공백
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let screeHeight = UIScreen.main.bounds.height
        
        GeometryReader { geo in
            let width = geo.size.width - (totalSpacing - leftrightSpacing)
            
            ZStack (alignment: .bottomLeading){
                ForEach(0..<headerInfo.count) { index in
                    Image(headerInfo[index].imageTitle)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screenWidth)
                        //.opacity(index == currentIndex ? 1 : 0)
                        .opacity(getOpacity(for: headerInfo[index], dragOffset: dragOffset, width: width))
                } // ForEach
                
                HStack(spacing: leftrightSpacing){
                    ForEach(headerInfo) { headerinfo in
                        Image(headerinfo.lineImageTitle)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width - totalSpacing) // 화면 전체 - 전체 공백
                        
                    } // ForEach
                    
                } // HStack
                .offset(x: CGFloat(currentIndex)*(-width) + dragOffset)
                .padding(.horizontal, 16)
                
            } // Group
            .gesture(
                DragGesture()
                // [note]
                /*
                 updating: 실시간
                 updating, onEnded의 value값은 둘 다 동일하다
                 모든 값을 갖고 있는게 value값임
                 inoutState의 값을 실시간으로 $offset에 넣어줌
                 offset은 무조건 @GestureState로 구현해야 함
                 offset에 실시간으로 값을 넣어줌
                 
                 value값은 DragGesture가 가지고 있다
                 */
                    .updating($dragOffset, body: { value, inoutState, inoutTransaction in
                        inoutState = value.translation.width // 실시간으로 드래그한 값이 들어간다
                    })
            // [note]
            /*
             onEnded: 손을 땠을때
             value값은 손을 땠을때 한번 업데이트됨
             */
                    .onEnded { value in
                        let widthOffset = value.translation.width
                        let howSwap = -widthOffset / width
                        let isNextIndex = howSwap.rounded()
                        
                        currentIndex = max(min(currentIndex + Int(isNextIndex), headerInfo.count-1),0)
                    } // onEnded
            ) // gesture
        } // GeometryReader
        .animation(.easeInOut, value: dragOffset == 0)
        //.border(.red)
        .frame(width: screenWidth, height: screeHeight/3.4)
    }
    
    private func getOpacity(for banner: HeaderModel, dragOffset: CGFloat, width: CGFloat) -> Double{
        let indexOffset = CGFloat(banner.index-1 - currentIndex)
        let totalOffset = indexOffset * (width - CGFloat(headerInfo.count - 1))
        let dragOffsetClamed = max(-width, min(dragOffset, width))
        let changeOffset = totalOffset + dragOffsetClamed
        
        return Double(1 - (changeOffset/UIScreen.main.bounds.width).magnitude)
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}




// TODO: opacity값 조정, color extension만들기
