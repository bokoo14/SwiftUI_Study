//
//  TodayCheckView2.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/05.
//

import SwiftUI

struct TodayCheckView2: View {
    @Environment(\.colorScheme) var colorMode
    
    var body: some View {
        ZStack{
            switch colorMode {
            case .light:
                Rectangle()
                    .cornerRadius(25)
                    .foregroundColor(.white)
                    .shadow(radius: 15)
            case .dark:
                Rectangle()
                    .cornerRadius(25)
                    .foregroundColor(Color.backgroundColor2)
                    .shadow(radius: 15)
            @unknown default:
                Text("default mode")
            }
            
            VStack (alignment: .center){
                HStack{
                    
                    Text("한눈에 보는 출석 규정")
                        .font(.system(size: 25, weight: .medium))
                    Spacer()
                }
                .padding(30)
                
                switch colorMode {
                case .light:
                    Image("regulationLight")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170, height: 300)
                case .dark:
                    Image("regulationDark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170, height: 300)
                @unknown default:
                    Text("default mode")
                }
                
                
                Spacer()
            }
        }
        .padding()
        .frame(height: UIScreen.main.bounds.size.height*0.6)
        
    }
}

//MARK: enviroment 다크모드
struct TodayCheckView2_Previews: PreviewProvider {
    static var previews: some View {
        TodayCheckView2()
    }
}
