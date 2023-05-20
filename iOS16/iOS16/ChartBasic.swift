//
//  ChartBasic.swift
//  iOS16
//
//  Created by Bokyung on 2023/04/30.
//

import SwiftUI
import Charts

//MARK: - Sample Model and Data
struct WeightModel: Identifiable {
    var id: String = UUID().uuidString
    var day: String
    var weight: Double
}

var weightData: [WeightModel] = [
    WeightModel(day: "Sun", weight: 77),
    WeightModel(day: "Mon", weight: 80),
    WeightModel(day: "Tue", weight: 90),
    WeightModel(day: "Wed", weight: 82),
    WeightModel(day: "Thu", weight: 70),
    WeightModel(day: "Fri", weight: 60),
    WeightModel(day: "Sat", weight: 88)
]

//MARK: - View
struct ChartBasic: View {
    
    // property
    let barColor: [Color] = [.red, .black, .blue, .green, .yellow, .purple, .teal]
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20){
                Text("1. 바형 차트")
                Chart(weightData) { item in
                    BarMark(x: .value("Day", item.day),
                            y: .value("Weight", item.weight))
                    .foregroundStyle(by: .value("Day", item.day))
                    .annotation (position: .top){
                        Image(systemName: "square.and.arrow.down")
                    } // annotation: 그래프에 원하는 이미지를 넣을 수 있음
                } // :Chart
                .chartForegroundStyleScale(domain: weightData.compactMap({ weight -> String in
                    weight.day
                }), range: barColor)
                .frame(height: 200) // :CustomColor - 내가 원하는 색으로 색깔 변경
                
                Divider()
                
                
                Text("2. 라인 차트")
                Chart(weightData) { item in
                    LineMark(x: .value("Day", item.day), y: .value("Weight", item.weight))
                        //.lineStyle(StrokeStyle(lineWidth: 10)) // 선 두께 조절
                        //.symbol(by: .value("Day", item.day)) // Day의 각각에 표시해주기
                        .interpolationMethod(.cardinal) // 선의 형태 조절
                } // :Chart
                .frame(height: 200)
                
                
                Text("3. 사각형 차트")
                Chart(weightData) { item in
                    RectangleMark(x: .value("Day", item.day), y: .value("Weight", item.weight))
                } // :Chart
                .frame(height: 200)
                
                
                Text("4. 범위 차트")
                Chart(weightData) { item in
                    AreaMark(x: .value("Day", item.day), y: .value("Weight", item.weight))
                        .interpolationMethod(.catmullRom) // :선의 형태 지정
                    
                    RuleMark(y: .value("Mid", 75))
                        .foregroundStyle(.red)
                } // :Chart
                .frame(height: 200)
                
                
                
            } // :VStack
        } // :ScrollView
        .padding()
    }
}

struct ChartBasic_Previews: PreviewProvider {
    static var previews: some View {
        ChartBasic()
    }
}
