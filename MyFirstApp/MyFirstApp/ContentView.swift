//
//  ContentView.swift
//  MyFirstApp
//
//  Created by Bokyung on 2023/03/22.
//

// 한 조각씩 배우는 SwiftUI - 입문편
import SwiftUI

// component 연습 - List
struct Person: Identifiable { // 식별가능해야 함 (고유해야 함)
    var id = UUID() // 각각의 unique id를 생성해줌
    let name: String
    let imageName: String
}

struct ContentView: View {
    // component 연습 - state
    // name은 구조체 안에 있는 변수이기 때문에 바꿀 수 없음 -> @State를 붙여줘야 한다
    @State var name: String = ""
    
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
        //        List{ // 정적인 List
        //            HStack{
        //                Image(systemName: "heart")
        //                Text("Apple")
        //            }
        //            HStack{
        //                Image(systemName: "heart.fill")
        //                Text("Developer")
        //            }
        //            HStack{
        //                Image(systemName: "bolt")
        //                Text("Academy")
        //            }
        //        }
        
        // 동적인 List
        //        let people: [Person] = [Person(name: "Apple", imageName: "heart"),
        //                                Person(name: "Developer", imageName: "heart.fill"),
        //                                Person(name: "Academy", imageName: "bolt")]
        //        List(people) { person in // person은 고유해야 함
        //            HStack{
        //                Image(systemName: person.imageName)
        //                Text(person.name)
        //            }
        //        }
        
        
        // component 연습 - Section
        //        List{
        //            Section {
        //                HStack{
        //                    Image(systemName: "heart")
        //                    Text("Apple")
        //                }
        //                HStack{
        //                    Image(systemName: "heart.fill")
        //                    Text("Developer")
        //                }
        //                HStack{
        //                    Image(systemName: "bolt")
        //                    Text("Academy")
        //                }
        //            } header: {
        //                Text("header1")
        //            }
        //
        //            Section {
        //                HStack{
        //                    Image(systemName: "heart")
        //                    Text("Apple")
        //                }
        //                HStack{
        //                    Image(systemName: "heart.fill")
        //                    Text("Developer")
        //                }
        //                HStack{
        //                    Image(systemName: "bolt")
        //                    Text("Academy")
        //                }
        //            } header: {
        //                Text("header2")
        //            }
        //
        //            Section{
        //                HStack{
        //                    Image(systemName: "heart")
        //                    Text("Apple")
        //                }
        //                HStack{
        //                    Image(systemName: "heart.fill")
        //                    Text("Developer")
        //                }
        //                HStack{
        //                    Image(systemName: "bolt")
        //                    Text("Academy")
        //                }
        //            } footer: {
        //                Text("copy right by bokoo")
        //            }
        //        }
        
        
        // component 연습 - Spacer
        //        VStack{
        //            Image(systemName: "bolt")
        //                .resizable()
        //                .aspectRatio(contentMode: .fit)
        //                .frame(width: 200)
        //
        //            Spacer()
        //            HStack{
        //                Image(systemName: "heart")
        //                Spacer() // 좌우의 공간을 만들어줌
        //                Text("Bolt!")
        //            } .padding(.horizontal, 30) // 좌우에 padding을 30만큼 줌
        //            Spacer() // 아래에 공간을 만들어줌
        //
        //            Button {
        //                print("Blink!")
        //            } label: {
        //                Text("Click me!")
        //            }
        //        }
        
        // component 연습 - color
        // Color(.blue).ignoresSafeArea(.all) // .bottom, .top, [.top, .bottom] 가능
        
        //        Color(.blue)
        //            .frame(width: 300, height: 300) //배경을 잘라서 사용 가능
        //            //.clipShape(Circle()) // 모양을 잘라도 됨 -> 동그란 모양으로
        //            .clipShape(RoundedRectangle(cornerRadius: 30)) // 모서리가 둥근 사각형
        
        //Color(red: 0.4, green: 0.5, blue: 0.1) // rgb를 활용
        //Color(hue: 0.3, saturation: 0.4, brightness: 0.5)
        //Color("NewColor") // assets에 저장된 색상 사용하기
        
        
        // component 연습 - View
        // View란? SwiftUI에서 그림을 그리도록 해주는 것
        // MyView() // 나의 view를 만들 수 있음
        
        
        // component 연습 - @State
        // state는 왜 필요할까? struct는 한번 만들면 그 안에 있는 내용을 바꾸기 힘들다, 그 내용을 한번 바꾸면 새로운 화면을 다시 그려야 한다, state변수가 바뀌면 화면을 새로 그릴 수 있음
        // 화면을 다시 그리기 위해서는 @State변수를 사용하여야 한다
        //        VStack {
        //            Text("Hi \(name)")
        //            Button {
        //                name = "Bokyung"
        //            } label: {
        //                Text("Click")
        //            }
        //        }
        
        
        // component 연습 - modifier
        // 점을 찍으면 내가 원하는 행동을 할 수 있다
        //        Image(systemName: "bolt")
        //            .resizable()
        //            .aspectRatio(contentMode: .fit)
        //            .frame(width: 100)
        //            .background(.green)
        //            .foregroundColor(.red)
        
        
        // component 연습 - padding
        //        VStack {
        //            Image(systemName: "bolt")
        //                .resizable()
        //                .aspectRatio(contentMode: .fit)
        //                .frame(width: 100)
        //                .background(.green)
        //                .foregroundColor(.red)
        //                .padding(.bottom, 100) // 방향과 크기를 입력받을 수 있다, 아무것도 입력하지 않으면 기본값인 .all이 들어간다
        //
        //            Image(systemName: "bolt")
        //                .resizable()
        //                .aspectRatio(contentMode: .fit)
        //                .frame(width: 100)
        //                .background(.green)
        //                .foregroundColor(.red)
        //                .padding(.leading, 100) // 왼쪽에 여백을 줌 [.bottom, .top]이런 식으로 넣는 것도 가능
        //        }
        
        // component 연습 - frame
        Image(systemName: "bolt")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 200, alignment: .trailing) // 기본 값은 .center .trailing, .leading이 올 수 있음
            .background(.green)
        
    }
}

// component 엽습 - View
struct MyView: View { // view를 직접 만들어 사용할 수 있음
    var body: some View {
        Text("this is my new view!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
