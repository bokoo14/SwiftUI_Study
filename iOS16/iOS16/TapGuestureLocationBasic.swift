//
//  TapGuestureLocationBasic.swift
//  iOS16
//
//  Created by Bokyung on 2023/05/17.
//

import SwiftUI

struct TapGuestureLocationBasic: View {
    @State var point: CGPoint = .init(x: 0.0, y: 0.0)
    
    @State var x: Double = 0.0
    @State var y: Double = 0.0
    
    var body: some View {
        VStack (spacing: 20){
            Text("x좌표: \(x)")
            Text("y좌표: \(y)")
            
            // Rectangle 범위 내에서 위치 - local
            Rectangle()
                .fill(.green)
                .frame(width: 300, height: 300)
                .padding()
                .onTapGesture (coordinateSpace: .local){ location in
                    point = location
                    // Tap했을때의 위치를 받아서 point변수에 넣어줌
                    convertToDouble(point: point)
                }
            
            // Rectangle 전체 내에서 위치 - global
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .padding()
                .onTapGesture (coordinateSpace: .global){ location in
                    point = location
                    // Tap했을때의 위치를 받아서 point변수에 넣어줌
                    convertToDouble(point: point)
                }
                
        }// :VStack
    }
    
    func convertToDouble(point: CGPoint){
        x = Double(point.x)
        y = Double(point.y)
    }
}

struct TapGuestureLocationBasic_Previews: PreviewProvider {
    static var previews: some View {
        TapGuestureLocationBasic()
    }
}
