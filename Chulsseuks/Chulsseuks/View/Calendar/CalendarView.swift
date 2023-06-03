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
            Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255).ignoresSafeArea()
        
        }
        .navigationTitle(Text("출쓱기록"))
        .navigationBarTitleDisplayMode(.inline)    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        NavigationView{
            CalendarView()
        }
            
    }
}
