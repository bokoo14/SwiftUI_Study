//
//  DetailGallery.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/25.
//

import SwiftUI

struct DetailGallery: View {
    // property
    let animal: Animal
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack (alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                } // :Loop
            } // :HStack
        } // :ScrollView
    }
}

struct DetailGallery_Previews: PreviewProvider {
    static var previews: some View {
        DetailGallery(animal: Animal.sampleAnimal)
    }
}
