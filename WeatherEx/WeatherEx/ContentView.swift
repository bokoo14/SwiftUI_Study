//
//  ContentView.swift
//  WeatherEx
//
//  Created by Bokyung on 2023/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var offset: CGFloat = 0
    
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
                    if offset >= 50 {
                        Text("포항시")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    else {
                        VStack{
                            Text("포항시")
                                .font(.title)
                                .foregroundColor(.white)
                            HStack {
                                Text("13°")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                Text("한때 흐림")
                                    .font(.title3)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    Text("13°")
                        .font(.system(size: 80, weight: .thin))
                        .foregroundColor(.white)
                        .opacity(setOpacity())
                    Text("한때 흐림")
                        .font(.title3)
                        .foregroundColor(.white)
                        .opacity(setOpacity())
                    HStack {
                        Text("최고 18°")
                            .font(.title3)
                            .foregroundColor(.white)
                            .opacity(setOpacity())
                        Text("최저 11°")
                            .font(.title3)
                            .foregroundColor(.white)
                            .opacity(setOpacity())
                    }
                } //: 1st VStack
                .offset(y: -offset+70) // Scroll을 해도 원래 그 자리에 고정되어 있도록 함
                .background(
                    //MARK: - GeometryReader
                    GeometryReader(content: { geometry -> Color in
                        // 현재 화면에서 VStack의 가장 위쪽 Y값이 어디인지 읽어와서 topOffset에 넣어줌
                        let minY = geometry.frame(in: .global).minY
                        
                        //MARK: - 동기, 비동기
                        DispatchQueue.main.async {
                            offset = minY
                        }
                        return Color.clear // 배경색상 없이
                    })
                ) //: background
                
                
                // 2번째 - 오후 12시쯤 청명한 상태가 예상됩니다
                BlurStackView {
                    Text("오전 12시쯤 청명한 상태가 예상됩니다.")
                        .foregroundColor(.white)
                } contentView: {
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack (spacing: 35) {
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                        }//: HStack
                    }//: ScrollView
                }
                
                BlurStackView {
                    Text("오전 12시쯤 청명한 상태가 예상됩니다.")
                        .foregroundColor(.white)
                } contentView: {
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack (spacing: 35) {
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                        }//: HStack
                    }//: ScrollView
                }

                BlurStackView {
                    Text("오전 12시쯤 청명한 상태가 예상됩니다.")
                        .foregroundColor(.white)
                } contentView: {
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack (spacing: 35) {
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                        }//: HStack
                    }//: ScrollView
                }
                
                BlurStackView {
                    Text("오전 12시쯤 청명한 상태가 예상됩니다.")
                        .foregroundColor(.white)
                } contentView: {
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack (spacing: 35) {
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                            ForecaseView(time: "지금", imageName: "cloud.sun", celcius: 13)
                        }//: HStack
                    }//: ScrollView
                }
                
                
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
    
    // 한때 흐림, 최고 최저 온도 스크롤하면 흐려지면서 사라지는 효과
    func setOpacity() -> CGFloat {
        if offset < 70 {
            return offset / 70
        }
        else {
            return 1
        }
    } //: setOpacity
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
