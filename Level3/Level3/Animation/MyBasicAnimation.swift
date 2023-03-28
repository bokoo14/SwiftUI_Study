//
//  MyBasicAnimation.swift
//  Level3
//
//  Created by Bokyung on 2023/03/26.
//

import SwiftUI

struct MyBasicAnimation: View {
    @State var isLighting: Bool = false
    
    var body: some View {
        VStack{
            Image(systemName: "cloud")
                .offset(y: -50)
            HStack{
                Image(systemName: "bolt")
                    .offset(y: isLighting ? 0: -50)
                    .padding()
                    .animation(.easeInOut(duration: 7), value: isLighting)
                Image(systemName: "bolt")
                    .offset(y: isLighting ? 0: -50)
                    .padding()
                    .animation(.easeIn(duration: 7), value: isLighting)
                Image(systemName: "bolt")
                    .offset(y: isLighting ? 0: -50)
                    .padding()
                    .animation(.easeOut(duration: 7), value: isLighting)
            }
            Button {
                isLighting.toggle()
            } label: {
                Text("click")
            }
        }

    }
}

struct MyBasicAnimation_Previews: PreviewProvider {
    static var previews: some View {
        MyBasicAnimation()
    }
}
