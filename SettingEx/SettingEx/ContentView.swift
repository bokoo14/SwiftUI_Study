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
                    toggleCell(imageName: "airplane", cellTitle: "에어플레인 모드", imageColor: .orange)
                    
                    navigationLinkCell(imageName: "wifi", cellTitle: "wifi", destination: {
                        Text("Wi-Fi")
                    }, imageColor: .blue, subTitle: "연결안됨")
                    
                    navigationLinkCell(imageName: "figure.stand.line.dotted.figure.stand", cellTitle: "Bluetooth", destination: {
                        Text("Bluetooth")
                    }, imageColor: .blue, subTitle: "켬")
    
                    navigationLinkCell(imageName: "antenna.radiowaves.left.and.right", cellTitle: "셀룰러", destination: {
                        Text("셀룰러")
                    }, imageColor: .green)
                    
                    navigationLinkCell(imageName: "personalhotspot", cellTitle: "개인용 핫스팟", destination: {
                        Text("개인용 핫스팟")
                    }, imageColor: .green)
                    
                }// :Section2
                
                
                Section {
                    navigationLinkCell(imageName: "gear", cellTitle: "일반", destination: {
                        Text("일반")
                    }, imageColor: .gray)
                    
                    navigationLinkCell(imageName: "hand.tap.fill", cellTitle: "손쉬운 사용", destination: {
                        Text("손쉬운 사용 뷰")
                    }, imageColor: .blue)
                    
                    navigationLinkCell(imageName: "hand.raised.fill", cellTitle: "개인 정보 보호", destination: {
                        Text("개인 정보 보호 뷰")
                    }, imageColor: .blue)
                    
                    navigationLinkCell(imageName: "hand.tap.fill", cellTitle: "손쉬운 사용", destination: {
                        Text("손쉬운 사용 뷰")
                    }, imageColor: .blue)
                    
                    
                    navigationLinkCell(imageName: "hourglass", cellTitle: "스크린 타임", destination: {
                        ScreenTimeView()
                    }, imageColor: .indigo)
                }//: Section3
                
                Section {
                    navigationLinkCell(imageName: "gear", cellTitle: "일반", destination: {
                        Text("일반")
                    }, imageColor: .gray)
                    
                    
                    navigationLinkCell(imageName: "hand.raised.fill", cellTitle: "암호", destination: {
                        Text("암호")
                    }, imageColor: .gray)
                }//: Section4
                
                Section {
                }//: Section5
                
            } //: List
            .navigationTitle("설정")
        }//: NavigationView
        
    }
    
    // 프로필 Cell
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
    
    // 토글 기능이 있는 Cell
    @ViewBuilder private func toggleCell(imageName: String, cellTitle: String, imageColor: Color) -> some View{
        HStack {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(.all, 4)
            .background(imageColor)
            .foregroundColor(.white)
            .cornerRadius(6)
            
            Toggle(cellTitle, isOn: $isAirPlane)
        }
    }
    
    // 단순히 NavigationLink만 있는 Cell
    // Protocol 'View' can only be used as a generic constraint because it has Self or associated type requirements
    @ViewBuilder private func navigationLinkCell<V: View>(imageName: String, cellTitle: String, destination: @escaping () -> V, imageColor: Color, subTitle: String? = nil) -> some View{
        NavigationLink {
            destination()
        } label: {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding(.all, 4)
                    .background(imageColor)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                if let subTitle = subTitle {
                    Text(cellTitle)
                    Spacer()
                    Text(subTitle)
                        .foregroundColor(.gray)
                }
                else{
                    Text(cellTitle)
                }
            }
        }
    } //: ViewBuilder - NavigationLinkCell
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
