//
//  SwiftUIView.swift
//  NWebToon
//
//  Created by Bokyung on 2023/07/29.
//

import SwiftUI

struct SwiftUIView2: View {
    @State var isShow : Bool = false
    @Namespace var lunabyungsin
    
    var body: some View {
        
        ZStack{
            
            if isShow {
                ZStack(alignment: .leading){
                    Rectangle()
                        .matchedGeometryEffect(id: "animation", in: lunabyungsin)
                        .frame(width: 50, height: 50)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.6)){
                                isShow.toggle()
                            }
                        }
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                
            } else {
                ZStack(alignment: .trailing) {
                    Rectangle()
                        .matchedGeometryEffect(id: "animation", in: lunabyungsin)
                        .frame(width: 50, height: 50)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.6)){
                                isShow.toggle()
                            }
                        }
                    
                }.frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        
    }
}

struct SwiftUIView2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView2()
    }
}
