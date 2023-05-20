//
//  AppStorage.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/07.
//

import SwiftUI

struct AppStorageBasic: View {
    
    // property
    // 일반적인 Data, 어플을 다시 켜면 값이 초기화됨
    @State var generalName: String?
    
    // App Storage 을 사용하면 앱을 다시 열때 자동으로 키에서 이름을 가져옵니다
    // key값인 name에 값이 저장되어, 앱을 다시 실행하더라도 값이 저장되어 있음
    @AppStorage("name") var appStorageName: String?
    
    var body: some View {
        VStack (spacing: 20) {
            // 일반적인 State
            VStack (spacing: 10){
                Text("@State 로 저장")
                    .font(.headline)
                
                // optional
                Text(generalName ?? "당신의 이름은 무엇인가요?")
                
                Button {
                    generalName = "Jacob"
                } label: {
                    Text("이름 불러오기")
                }
            } //: VSTACK
            .padding()
            .border(.green)
            
            
            // @App Storage사용
            VStack (spacing: 20) {
                Text("@App Storage 사용")
                    .font(.headline)
                
                Text(appStorageName ?? "당신의 이름은 무엇인가요?")
                
                Button {
                    appStorageName = "Bokyung"
                } label: {
                    Text("이름 불러오기")
                }
            } // : VStack
            .padding()
            .border(.green)
            
        }
    }
}
struct AppStorage_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBasic()
    }
}
