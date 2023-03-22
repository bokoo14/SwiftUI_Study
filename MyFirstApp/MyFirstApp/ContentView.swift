//
//  ContentView.swift
//  MyFirstApp
//
//  Created by Bokyung on 2023/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // component 연습 - Button
        //        Button {
        //            print("Hitted2")
        //        } label: {
        //            Text("HitMe2!!")
        //                .padding()
        //                .frame(width: 150)
        //                .background(.indigo)
        //                .cornerRadius(13)
        //        }
        
        //        Button("Delete", role: .destructive) {
        //            print("deleted!")
        //        }
        
        
        // component 연습 - Text
        //        VStack {
        //            Text("Hello Bokyung") // text
        //                .bold()
        //                .italic()
        //                .strikethrough()
        //            Text("Hello Bokyung") // size
        //                .font(.system(size: 40))
        //            Text("Hello Bokyung") // color
        //                .underline(true, color: .orange)
        //                .foregroundColor(.white)
        //                .background(.black)
        //            Text("Hello Bokyung")
        //                .foregroundColor(.green)
        //                .font(.system(size: 25, weight: .bold, design: .rounded))
        //        }
        
        
        // component 연습 - Image
        //        Image("짱구")
        //            .resizable() // 크기 변경 가능하게 바꾸기
        //            .aspectRatio(contentMode: .fit) // 비율 조절 -> fit, fill
        //            .frame(width: 200, height: 200) // 사이즈 조절
        //            .clipped() // image 자르기 -> 200, 200에 맞게
        //            .background(.cyan) // 백그라운드 색깔
        //            .border(.black, width: 7) // 테두리
        
        //        Image(systemName: "heart.fill") // sf symbol
        //            .resizable()
        //            .aspectRatio(contentMode: .fit)
        //            .frame(width: 50, height: 50)
        
        
        // component 연습 - VStack, HStack, ZStack
        //        VStack (alignment:.leading){ // 수직 스택 -> 최대 10개까지 넣을 수 있음
        //            Text("1")
        //            Text("2")
        //            Text("3")
        //                .background(.blue)
        //        } .frame(width: 300, height: 300, alignment: .leading)
        //            .background(.orange)
        
        //        HStack{ // 수평 스택
        //            Text("1")
        //            Text("2")
        //            Text("3")
        //        }
        
        //        ZStack{ // z축 스택 (위로 쌓기)
        //            Text("1")
        //            Text("2")
        //            Text("3")
        //        }
        
        
        // component 연습 - ScrollView
        //        ScrollView { // VStack으로 하면 scroll안됨 -> ScrollView를 사용해야함!
        //            // 기본적으로 VStack -> 위아래 scroll
        //            Text("1")
        //                .frame(width: 300, height: 500)
        //                .background(.red)
        //
        //            Text("2")
        //                .frame(width: 300, height: 500)
        //                .background(.blue)
        //
        //            Text("3")
        //                .frame(width: 300, height: 500)
        //                .background(.orange)
        //        }
        //        .background(.black) //ScrollView를 사용하면 전체 화면에서 View가 생기는 것이 아닌 짤림!
        
        //        ScrollView (.horizontal, showsIndicators: false){ // 좌우 스크롤, indicator가리기
        //            HStack{ // 수평스택
        //                Text("1")
        //                    .frame(width: 300, height: 500)
        //                    .background(.red)
        //
        //                Text("2")
        //                    .frame(width: 300, height: 500)
        //                    .background(.blue)
        //
        //                Text("3")
        //                    .frame(width: 300, height: 500)
        //                    .background(.orange)
        //            }
        //        }.background(.black)
        
        
        // componenet 연습 - List
        // UIKit의 UITableView와 비슷한 기능을 함
        List{ // 정적인 List
            HStack{
                Image(systemName: "heart")
                Text("Apple")
            }
            HStack{
                Image(systemName: "heart.fill")
                Text("Developer")
            }
            HStack{
                Image(systemName: "bolt")
                Text("Academy")
            }
        }
        
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
