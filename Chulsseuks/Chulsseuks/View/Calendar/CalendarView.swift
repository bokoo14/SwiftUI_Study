//
//  CalendarView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/03.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        ZStack{
            CustomTabView()
        }
        .navigationTitle("출쓱 기록")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        NavigationView{
            CalendarView()
        }
            
    }
}
