//
//  CalendarView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/03.
//

import SwiftUI

struct CalendarView: View {
    @State var showSheet: Bool = false
    var body: some View {
        ZStack{
            CustomTabView()
        }
        .navigationTitle("출쓱 기록")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                showSheet.toggle()
            } label: {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(Color.iColor)
            }
        } // toolbar
        .sheet(isPresented: $showSheet) {
            CalendarModalView()
        }
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
