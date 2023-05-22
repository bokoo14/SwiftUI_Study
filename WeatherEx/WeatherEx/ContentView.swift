//
//  ContentView.swift
//  WeatherEx
//
//  Created by Bokyung on 2023/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var topOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            // 이미지를 화면만큼 잘라준다
            GeometryReader { geometry in
                Image("cloudy")
                    .resizable()
                    .scaledToFill()
            }
            .ignoresSafeArea()
            
            ScrollView {
                // 1번째 - 포항시 날씨
                VStack {
                    Text("포항시")
                        .font(.title)
                    Text("13°")
                        .font(.system(size: 80))
                    Text("한때 흐림")
                        .font(.title3)
                    HStack {
                        Text("최고 18°")
                            .font(.title3)
                        Text("최저 11°")
                            .font(.title3)
                    }
                } //: 1st VStack
                
                
                // 2번째 - 오후 12시쯤 청명한 상태가 예상됩니다
                VStack (spacing: 0) {
                    Text("오전 12시쯤 청명한 상태가 예상됩니다.")
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial) // 배경을 반투명하게 해줌
                        .zIndex(1) // HStack을 밑으로 깔고, Text를 위로 올리기 위해
                    
                    Divider()
                    
                    // HStack: 시간대별 날씨
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
                    }//: HStack: 시간대별 날씨
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial) // 배경을 반투명하게 해줌
                    //MARK: - offset
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
                
                
                // 3번째 - 10일간의 일기예보
                VStack {
                    HStack{
                        Image(systemName: "calendar")
                        Text("10일간의 일기예보.")
                    }
                    
                    Divider()
                    
                    VStack {
                        HStack{
                            Text("오늘")
                            Image(systemName: "cloud.fill")
                            Text("13°")
                            Text("13°")
                        }//: HStack
                        
                        HStack{
                            Text("오늘")
                            Image(systemName: "cloud.fill")
                            Text("13°")
                            Text("13°")
                        }//: HStack
                        
                        HStack{
                            Text("오늘")
                            Image(systemName: "cloud.fill")
                            Text("13°")
                            Text("13°")
                        }//: HStack
                    }//: VStack
                } //: 3rd VStack
                .background(.red)
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
