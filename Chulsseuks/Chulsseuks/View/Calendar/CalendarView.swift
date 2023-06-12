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
        CustomTabView()
            .navigationTitle(CalendarViewString().log)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    showSheet.toggle()
                } label: {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(Color("iColor"))
                }
            } // toolbar
            .sheet(isPresented: $showSheet) {
                CalendarModalView()
            } // sheet
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
