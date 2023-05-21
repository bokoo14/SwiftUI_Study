//
//  ContentView.swift
//  WeatherEx
//
//  Created by Bokyung on 2023/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("cloudy")
                .resizable()
                .scaledToFill()
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
                } //: VStack
                
                // 2번째 - 오후 12시쯤 청명한 상태가 예상됩니다
                VStack {
                    Text("오전 12시쯤 청명한 상태가 예상됩니다.")
                    Divider()
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
                    }//: HStack
                }//: VStack
                .padding()
                .background(.red)
                
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
                } //: VStack
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
