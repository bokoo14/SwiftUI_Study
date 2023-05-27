//
//  BlurStackView.swift
//  WeatherEx
//
//  Created by Bokyung on 2023/05/22.
//

import SwiftUI

struct BlurStackView<Header: View, Content: View>: View {
    var headerView: Header
    var contentView: Content
    
    @State var topOffset: CGFloat = 0
    
    init(@ViewBuilder headerView: @escaping ()->Header,
         @ViewBuilder contentView: @escaping ()->Content) {
        self.headerView = headerView()
        self.contentView = contentView()
    }
    
    var body: some View {
        // 2번째 - 오후 12시쯤 청명한 상태가 예상됩니다
        VStack (spacing: 0) {
            headerView
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .background(.ultraThinMaterial) // 배경을 반투명하게 해줌
                .zIndex(1) // HStack을 밑으로 깔고, Text를 위로 올리기 위해
            
            Divider()
            
            // HStack: 시간대별 날씨
            contentView
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial) // 배경을 반투명하게 해줌
            //MARK: - offset
            // 오프셋이란, 기준이 되는 주소에 더해지는 값을 의미한다. View 타입에 적용되는 이 메소드는 x, y 값 입력을 통해 해당 View의 위치를 조정한다.
            // 현재 위치가 200보다 아래이면 더해주는 값 없음, 200보다 위에 있으면 200에 고정시켜줌 (고정시켜주기 위해 )
            .offset(y: topOffset >= 200 ? 0 : topOffset - 200)
            .zIndex(0) // HStack을 밑으로 깔고, Text를 위로 올리기 위해
            .clipped() // 올라가면서 위쪽 부분은 없어지도록
        } //: 2nd VStack
        .offset(y: topOffset >= 200 ? 0 : -(topOffset - 200))
        .background(
            //MARK: - GeometryReader
            GeometryReader(content: { geometry -> Color in
                // 현재 화면에서 VStack의 가장 위쪽 Y값이 어디인지 읽어와서 topOffset에 넣어줌
                let minY = geometry.frame(in: .global).minY
                
                //MARK: - 동기, 비동기
                DispatchQueue.main.async {
                    topOffset = minY
                }
                return Color.clear // 배경색상 없이
            })
        ) //: background
        .padding()
         //: 2nd VStack
    }
}

struct BlurStackView_Previews: PreviewProvider {
    static var previews: some View {
        // 2번째 - 오후 12시쯤 청명한 상태가 예상됩니다
        BlurStackView {
            Text("오전 12시쯤 청명한 상태가 예상됩니다.")
        } contentView: {
            HStack {
                VStack {
                    Text("지금")
                    Image(systemName: "cloud.fill")
                    Text("13°")
                }
                VStack {
                    Text("오후 10시")
                    Image(systemName: "cloud.fill")
                    Text("13°")
                }
                VStack {
                    Text("오후 11시")
                    Image(systemName: "cloud.fill")
                    Text("13°")
                }
                VStack {
                    Text("오전 12시")
                    Image(systemName: "cloud.fill")
                    Text("13°")
                }
            } //: HStack: 시간대별 날씨
        } //: BlurStackView


    }
}
