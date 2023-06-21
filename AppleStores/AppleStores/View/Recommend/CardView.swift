//
//  CardView.swift
//  AppleStores
//
//  Created by Bokyung on 2023/06/15.
//

import SwiftUI

struct CardView: View {
    @StateObject var recommendViewModel: RecommendViewModel = RecommendViewModel()
    let sideSpacing: CGFloat = 20 // Card 좌우 공백
    let totalSpacing: CGFloat = 60 // 전체 뷰에서 Card를 제외한 공백
    @State var index: Int = 0
    // Gesture를 감지하는 변수를 GestureState 키워드를 통해 바인딩을 하여 변수가 true일 때만 guesture를 실행하는 식으로 Gesture를 제공
    @GestureState var offset: CGFloat = 0
    
    // drag gesture
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                
            }
            .onEnded { value in
                
            }
    }
    
    var body: some View {
        
//        TabView {
//            ForEach(recommendViewModel.recommendViewModel) { rv in
//                CardDetailView(title: rv.title, explain: rv.explain, imageName: rv.imageName, titleColor: rv.titleColor, explainColor: rv.explainColor)
//            }
//        }
        HStack (spacing: 20){
            ForEach(recommendViewModel.recommendViewModel) { rv in
                CardDetailView(title: rv.title, explain: rv.explain, imageName: rv.imageName, titleColor: rv.titleColor, explainColor: rv.explainColor)
                    .frame(width: 335, height: 509)
                    .border(.blue)
            }
        }
        .tabViewStyle(.page)
        .frame(height: 509)
        .border(.red)
        .gesture(drag)
    }
}

struct CardDetailView: View {
    let title: String
    let explain: String
    let imageName: String
    let titleColor: String
    let explainColor: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 509)
            .frame(maxWidth: UIScreen.main.bounds.width * 0.85)
            .shadow(radius: 5, x: 1, y: 1)
            .overlay {
                VStack (spacing: 0){
                    Text(title)
                        .font(.system(size: 24, weight: .semibold))
                    //.border(.orange)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 24, leading: 20, bottom: 8, trailing: 0))
                        .foregroundColor(Color(titleColor))
                    //.border(.orange)
                    
                    Text(explain)
                        .font(.system(size: 14, weight: .light))
                    //.border(.orange)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(explainColor))
                    //.border(.orange)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                //.border(.blue)
            }
        //.border(.red)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
