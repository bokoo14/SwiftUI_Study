//
//  TabDetailView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/04.
//

import SwiftUI

struct TabDetailView: View {
    @Binding var selectedTab: CustomTabView.CalendarTabInfo
    
    var body: some View {
        VStack{
            switch selectedTab{
            case .one:
                List {
                    HStack{
                        Text("5월")
                            .font(.system(size: 23, weight: .medium))
                        Text("(5/6~6/5)")
                            .font(.system(size: 23))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("-6점")
                            .font(.system(size: 23, weight: .medium))
                    }
                    .padding(.vertical)
                    
                    HStack{
                        absenceComponent()
                        Text("5/15")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("-6점")
                            .font(.system(size: 18))
                    }
                }
                
            case .two:
                List {
                    HStack{
                        Text("전체 기간")
                            .font(.system(size: 23, weight: .medium))
                        Spacer()
                        Text("-6점")
                            .font(.system(size: 23, weight: .medium))
                    }
                    .padding(.vertical)
                    
                    HStack{
                        absenceComponent()
                        Text("5/15")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("-6점")
                            .font(.system(size: 18))
                    }
                }
                
            }
            
        }
    }
}

struct TabDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TabDetailView(selectedTab: .constant(.one))
    }
}