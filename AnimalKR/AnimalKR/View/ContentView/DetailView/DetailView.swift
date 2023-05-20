//
//  DetailView.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/25.
//

import SwiftUI

struct DetailView: View {
    // property
    let animal: Animal
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20) {
                // 1. HeadImage
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                
                // 2. Title
                Text(animal.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.vertical, 10)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 25)
                    )
                
                
                // 3. Headline
                Text(animal.headline)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.accentColor)
                    .padding()
                
                
                // 4. Gallery
                // VStack안에 단위가 10개를 넘지 못하게 되어 있음
                Group{
                    DetailHead(headingImage: "photo.on.rectangle.angled", headingText: "\(animal.name)")
                    
                    DetailGallery(animal: animal)
                }
                
                
                // 5. Description
                Group {
                    DetailHead(headingImage: "info.circle", headingText: "자세한 정보")
                    Text(animal.description)
                        .font(.subheadline)
                        .padding(.horizontal, 10)
                }
                
                // 6. Fact
                Group {
                    DetailHead(headingImage: "location.magnifyingglass", headingText: "팩트체크")
                    DetailFact(animal: animal)
                }
                
                // 7. Ref
                Group {
                    DetailHead(headingImage: "books.vertical", headingText: "참고자료")
                    ExternalWebLink(animal: animal)
                }
                
                
                // 8. copyright
                Text(animal.copyright)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
            } // :VStack
            .navigationBarTitle("\(animal.name) 자세히 알아보기", displayMode: .inline)
        } // :ScrollView
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        // parent에서 이미 Navigation이 있어서 안해도 되지만, preview에서는 안보이니까 NavigationView를 넣어서 확인
        NavigationView {
            DetailView(animal: Animal.sampleAnimal)
        }
    }
}
