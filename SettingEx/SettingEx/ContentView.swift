//
//  ContentView.swift
//  SettingEx
//
//  Created by Bokyung on 2023/05/18.
//

import SwiftUI

struct ContentView: View {
    @State var isAirPlane: Bool = false
    
    var body: some View {
        NavigationView {
            List{
                Section {
                    NavigationLink {
                        SettingView()
                    } label: {
                       profileCell()
                    }// :NavigationLink
                    
                }// :Section1
                
                Section {
                    HStack {
                        Image(systemName: "airplane")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.all, 4)
                            .background(.orange)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                        
                        Toggle(isOn: $isAirPlane) {
                            Text("에어플레인 모드")
                        }
                    }
                    
                    NavigationLink {
                        Text("Wi-Fi")
                    } label: {
                        HStack {
                            Image(systemName: "wifi")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.all, 4)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            Text("Wi-Fi")
                            Spacer()
                            Text("연결안됨")
                                .foregroundColor(.gray)
                        }
                    }
                    
                    NavigationLink {
                        Text("Bluetooth")
                    } label: {
                        HStack {
                            Image(systemName: "figure.stand.line.dotted.figure.stand")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.all, 4)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            Text("Bluetooth")
                            Spacer()
                            Text("켬")
                                .foregroundColor(.gray)
                        }
                    }
                    
                    NavigationLink {
                        Text("셀룰러")
                    } label: {
                        HStack {
                            Image(systemName: "antenna.radiowaves.left.and.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.all, 4)
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            Text("셀룰러")
                        }
                    }
                    
                    NavigationLink {
                        Text("개인용 핫스팟")
                    } label: {
                        HStack {
                            Image(systemName: "personalhotspot")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.all, 4)
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            Text("개인용 핫스팟")
                        }
                    }
                    
                }// :Section2
                
                
                Section {
                    NavigationLink {
                        Text("일반 뷰")
                    } label: {
                        HStack {
                            Image(systemName: "gear")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.all, 4)
                                .background(.gray)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            Text("일반")
                        }
                    }
                    
                    NavigationLink {
                        Text("손쉬운 사용 뷰")
                    } label: {
                        HStack {
                            Image(systemName: "hand.tap.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.all, 4)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            Text("손쉬운 사용")
                        }
                    }
                    
                    NavigationLink {
                        Text("개인 정보 보호 뷰")
                    } label: {
                        HStack {
                            Image(systemName: "hand.raised.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.all, 4)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            Text("개인 정보 보호")
                        }
                    }
                    
                    HStack {
                        Image(systemName: "hourglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.all, 4)
                            .background(.indigo)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                        NavigationLink("스크린 타임") {
                            ScreenTimeView()
                        }
                    }// :HStack
                }//: Section3
                
                Section {
                    NavigationLink {
                        Text("일반 뷰")
                    } label: {
                        HStack {
                            Image(systemName: "gear")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.all, 4)
                                .background(.gray)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            Text("일반")
                        }
                    }
                    
                    NavigationLink {
                        Text("암호")
                    } label: {
                        HStack {
                            Image(systemName: "hand.raised.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.all, 4)
                                .background(.gray)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            Text("암호")
                        }
                    }
                }//: Section4
                
                Section {
                }//: Section5
                
            } //: List
            .navigationTitle("설정")
        }//: NavigationView
        
    }
    
    @ViewBuilder private func profileCell() -> some View {
        Circle()
            .frame(width: 50)
            .foregroundColor(.gray)
            .overlay {
                Text("Luna")
                    .foregroundColor(.white)
            }
        VStack (alignment: .leading, spacing: 3){
            Text("Bokyung")
                .font(.system(size: 24, weight: .regular))
            Text("Apple ID, iCloud, 미디어 및 구입")
                .font(.system(size: 14))
        }
        .padding(.leading, 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
