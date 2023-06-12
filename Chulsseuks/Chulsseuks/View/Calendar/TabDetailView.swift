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
                CustomList(month: TabDetailViewString().month, duration: TabDetailViewString().duration, date: TabDetailViewString().date, point: TabDetailViewString().point)
                
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
                .scrollContentBackground(.hidden)
                .background(Color("backgroundColor").ignoresSafeArea())
                
            }
        }
    }
}

struct TabDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TabDetailView(selectedTab: .constant(.one))
    }
}
