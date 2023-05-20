//
//  ExternalWebLink.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/25.
//

import SwiftUI

struct ExternalWebLink: View {
    
    // property
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("멸종 위기 야생생물 포털")
                
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    // URL은 무조건 옵셔널해줘야 함
                    // 외부 링크로 연결
                    Link(destination: URL(string: animal.link)!) {
                        Text(animal.name)
                    }
                    .foregroundColor(.accentColor)
                }
            }
        }
    }
}

struct ExternalWebLink_Previews: PreviewProvider {
    static var previews: some View {
        ExternalWebLink(animal: Animal.sampleAnimal)
    }
}
