//
//  StateComponent.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/04.
//

import SwiftUI

// 결석표시 컴포넌트
struct absenceComponent: View {
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                Text(stateComponentString().absence)
                    .font(.system(size: 20))
            }
            .frame(width: 75, height: 25, alignment: .center)
            .padding(5)
            .background(Color.redColor)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
    }
}

// 지각표시 컴포넌트
struct lateComponent: View {
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "exclamationmark.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                Text(stateComponentString().late)
                    .font(.system(size: 20))
            }
            .frame(width: 75, height: 25, alignment: .center)
            .padding(5)
            .background(Color.yellowColor)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
    }
}

// 출석표시 컴포넌트
struct attendanceComponent: View {
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                Text(stateComponentString().attendance)
                    .font(.system(size: 20))
            }
            .frame(width: 75, height: 25, alignment: .center)
            .padding(5)
            .background(Color.greenColor)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
    }
}


struct StateComponent_Previews: PreviewProvider {
    static var previews: some View {
        absenceComponent()
        lateComponent()
        attendanceComponent()
    }
}
