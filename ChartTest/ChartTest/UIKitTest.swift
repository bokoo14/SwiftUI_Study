//
//  UIKitTest.swift
//  ChartTest
//
//  Created by Bokyung on 1/21/24.
//

import SwiftUI


struct TestView: UIViewRepresentable {
    var value: CGFloat // value 매개변수 추가
    
    func makeUIView(context: Context) -> UIView {
        let customView = CustomView()
        customView.value = self.value // value 값 전달
        return customView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        guard let customView = uiView as? CustomView else { return }
        customView.value = value // value 값 업데이트
        customView.setNeedsDisplay() // 변경사항을 반영하기 위해 화면을 다시 그립니다.
    }

}


class CustomView: UIView {
    var value: CGFloat = 0.0 // 데이터가 채워진 비율 (0.0부터 1.0까지)
    
    override init(frame: CGRect) {
         super.init(frame: frame)
         backgroundColor = UIColor.clear // 배경색 지정
     }
     
     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         backgroundColor = UIColor.clear // 배경색 지정
     }
     
    override func draw(_ rect: CGRect) {
//        var value: CGFloat = 0.3 // 데이터가 채워진 비율 (0.0부터 1.0까지)
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius: CGFloat = min(rect.width, rect.height) / 2 - 20
        let grayColor = UIColor(named: "customGray") ?? UIColor.systemGray
        let redColor = UIColor(named: "customRed") ?? UIColor.red
        
        // 회색 선 경로
        let grayPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        grayColor.setFill()
        grayPath.fill()
        
        // 가운데 뚫어주기
        let innerPath = UIBezierPath(arcCenter: center, radius: radius - 28, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        grayColor.setFill()
        innerPath.fill(with: .clear, alpha: 1.0) // 가운데를 뻥 뚫어줌
        
        // 빨간 선 경로
        let redPath = UIBezierPath(arcCenter: center, radius: radius - 14, startAngle: -.pi / 2, endAngle: -.pi / 2 + 2 * .pi * value, clockwise: true)
        redColor.setStroke()
        redPath.lineWidth = 28
        redPath.lineCapStyle = .round // 끝 부분을 뭉툭하게 만듦
        redPath.stroke()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(value: 0.3)
            .frame(width: 249, height: 249)
    }
}
