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
    // index가 1일때: 16 카드 10 6
    // index가 2이상일때: 6 10 카드 10 6
    let leftrightSpacing: CGFloat = 10 // 배너 좌우 공백
    let totalSpacing: CGFloat = 32 // 배너를 제외한 전체 공백
    
    let headerInfo: [HeaderModel] = {
        var headerArray: [HeaderModel] = []
        for index in 1..<9 {
            let header = HeaderModel(imageTitle: "ImgBanner0\(index)", lineImageTitle: "ImgLineBanner0\(index)")
            headerArray.append(header)
        }
        return headerArray
    }()
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let screeHeight = UIScreen.main.bounds.height
        
        GeometryReader { geo in
            let width = geo.size.width - (totalSpacing - leftrightSpacing)
            
            ZStack (alignment: .bottomLeading) {
                ForEach(0..<headerInfo.count) { index in
                    Image(headerInfo[index].imageTitle)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(index == currentIndex ? 1 : 0)
                    //.animation(.linear, value: 1)
                } // ForEach
                
                HStack(spacing: leftrightSpacing){
                    ForEach(headerInfo) { headerinfo in
                        Image(headerinfo.lineImageTitle)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width - totalSpacing) // 화면 전체 - 전체 공백
                        
                    } // ForEach
                    
                } // HStack
                .offset(x: CGFloat(currentIndex)*(-width) + offset)
                .padding(.horizontal, 16)
                
            } // Group
            .gesture(
                DragGesture()
                    .updating($offset, body: { dragGestureValue, inoutState, inoutTransaction in
                        inoutState = dragGestureValue.translation.width
                        
                        
                    })
                
                    .onEnded { value in
                        let widthOffset = value.translation.width
                        let howSwap = -widthOffset / width
                        let isNextIndex = howSwap.rounded()
                        
                        currentIndex = max(min(currentIndex + Int(isNextIndex), headerInfo.count-1),0)
                    } // onEnded
            ) // gesture
        } // GeometryReader
        .animation(.easeInOut, value: offset == 0)
        //.border(.red)
        .frame(width: screenWidth, height: screeHeight/3.4)
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}




// TODO: opacity값 조정, color extension만들기
