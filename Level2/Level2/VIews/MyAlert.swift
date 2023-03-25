//
//  MyAlert.swift
//  Level2
//
//  Created by Bokyung on 2023/03/25.
//

import SwiftUI

struct MyAlert: View {
    @State var isShowingAlert: Bool = false
    
    var body: some View {
        // alert
        Button {
            isShowingAlert = true
        } label: {
            Text("Show alert!")
        } .alert(isPresented: $isShowingAlert) {
            //Alert(title: Text("This is alert!"))
            //Alert(title: Text("this is alert button"), message: Text("this is message"), dismissButton: .default(Text("Bokoo!")))
            Alert(title: Text("this is alert!"), primaryButton: .default(Text("Ok!")), secondaryButton: .cancel()) // cancel 버튼을 secondary에 넣더라도 항상 cancel은 왼쪽에 배치됨
            
        }

    }
}

struct MyAlert_Previews: PreviewProvider {
    static var previews: some View {
        MyAlert()
    }
}
