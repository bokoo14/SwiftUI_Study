//
//  DetailFact.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/25.
//

import SwiftUI

struct DetailFact: View {
    // property
    let animal: Animal
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            } // :TabView
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } // :GroupBox
    }
}

struct DetailFact_Previews: PreviewProvider {
    static var previews: some View {
        DetailFact(animal: Animal.sampleAnimal)
    }
}
