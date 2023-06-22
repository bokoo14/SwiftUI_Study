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
    
    @State var index: Int = 0 // 3개의 뷰 중,
    // Gesture를 감지하는 변수를 GestureState 키워드를 통해 바인딩을 하여 변수가 true일 때만 guesture를 실행하는 식으로 Gesture를 제공
    // CGPoint와 CGSize의 차이를 생각하면서 하세요
    @GestureState var offset: CGFloat = 0
    
    
    // drag gesture
    var drag: some Gesture {
        DragGesture()
        // updating: DragGesture를 하는 도중에 발생하는 event
        //.updating(<#T##state: GestureState<State>##GestureState<State>#>, body: <#T##(DragGesture.Value, inout State, inout Transaction) -> Void#>)
        // value에는 여러 값이 있고, 그 값을 활용 -> 예: translation과 같은 값을 가지고 있음
        // inoutState의 값은 앞에 있는 state의 값과 동일한 변수
            .updating($offset, body: { value, inoutState, inoutTransaction in
                inoutState = value.translation.width
            })
        // onChanged: 변화가 있으면 실행해라
        // value: value.startLocation같은 많은 것들이 들어있다
            .onChanged({ value in })
        // 손을 뗐을때 실행됨
        // 마지막 값을 갖고 싶을때
        // value: value.startLocation같은 많은 것들이 들어있다
            .onEnded { value in
                // draw gesture로 변화된 width값
                let widthOffset = value.translation.width
                //let howSwap = -widthOffset / (UIScreen.main.bounds)
                
            }
    }
    
    var body: some View {
        let adjustmentWidth = (totalSpacing / 2) - sideSpacing
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
            } // ForEach
        }
        .frame(height: 509)
        .border(.red)
        .gesture(drag)
        // offset이
        .animation(.easeInOut, value: offset == 0)
        .offset(x: (CGFloat(index) * (-UIScreen.main.bounds.width) + (index != 0 ? adjustmentWidth : 0) + offset))
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
