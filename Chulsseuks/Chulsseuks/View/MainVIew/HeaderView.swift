//
//  HeaderView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/09.
//

import SwiftUI

struct HeaderView: View {
    // MARK: 반응형으로 만들고 싶음 -> Geomerty Reader로 할지, UIScreen으로 할지
    var body: some View {
        HStack {
            Spacer()
            
            //            NavigationLink {
            //                CalendarView()
            //            } label: {
            //                Image(systemName: "calendar")
            //                    .resizable()
            //                    .aspectRatio(contentMode: .fit)
            //                    .frame(width: UIScreen.main.bounds.width * 0.06)
            //                    .padding(.trailing, 20)
            //            }
            
            
            //            NavigationLink {
            //                SettingsView()
            //            } label: {
            //                Image(systemName: "gearshape")
            //                    .resizable()
            //                    .aspectRatio(contentMode: .fit)
            //                    .frame(width: UIScreen.main.bounds.width * 0.06)
            //            }
            
            
            // MARK: NavigationLink 가독성 - destination을 사용
            NavigationLink (destination: CalendarView()) {
                Image(systemName: "calendar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                    .frame(width: UIScreen.main.bounds.width * 0.06)
                    .frame(width: 24)
                    .padding(.trailing, 20)
            }
            
            NavigationLink (destination: SettingsView()) {
                Image(systemName: "gearshape")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.06)
                    .border(.red)
                
                //                Text("\(Image(systemName: "gearshape"))")
            }
        }
        .foregroundColor(.indigo)
        .padding(.vertical, 20)
        //.padding(.horizontal, 15)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
