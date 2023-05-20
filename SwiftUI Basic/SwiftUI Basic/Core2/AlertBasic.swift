//
//  AlertBasic.swift
//  SwiftUI Basic
//
//  Created by Bokyung on 2023/04/09.
//

import SwiftUI

struct AlertBasic: View {
    // alert: pop-up 창으로 UI화면에 메세지를 나타냄
    // property
    @State var showAlert1: Bool = false
    @State var showAlert2: Bool = false
    @State var showAlert3: Bool = false
    @State var showAlert4: Bool = false
    
    @State var backgroundColor: Color = Color.yellow
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    @State var alertType: AlterCase? = nil
    
    enum AlterCase {
        case success
        case error
    }
    
    func getAlert2() -> Alert {
        return Alert(title: Text("메세지 삭제"),
                     message: Text("정말로 메세지 삭제 하시겠습니까?"),
                     primaryButton: .destructive(Text("delete"), action: {
            backgroundColor = .red
        }), secondaryButton: .cancel())
    }
    
    func getAlert3() -> Alert {
        return Alert(title: Text(alertTitle),
                     message: Text(alertMessage),
                     dismissButton: .default(Text("OK")))
    }
    
    func getAlert4() -> Alert {
        switch alertType {
        case .error:
            return Alert(title: Text("에러 발생 다시 확인하세요"), dismissButton: .default(Text("OK"), action: {
                backgroundColor = .red
            }))
        case .success:
            return Alert(title: Text("로그인에 성공 했습니다"), dismissButton: .default(Text("OK"), action: {
                backgroundColor = .green
            }))
        default:
            return Alert(title: Text("에러"))
        }
    }
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            VStack (spacing: 20){
                // 1번
                Button {
                    showAlert1.toggle()
                } label: {
                    Text("1번 Alert")
                }.alert(isPresented: $showAlert1) {
                    Alert(title: Text("패스워드 에러입니다. 다시 확인하세요."))
                }
                
                // 2번
                Button {
                    showAlert2.toggle()
                } label: {
                    Text("2번 Alert")
                }.alert(isPresented: $showAlert2) {
                    getAlert2()
                }
                
                // 3번
                HStack (spacing: 10){
                    Button {
                        alertTitle = "영상이 업로드 에러"
                        alertMessage = "영상이 제대로 올라가지 않았습니다. 다시 확인해 주세요"
                        showAlert3.toggle()
                    } label: {
                        Text("3번 Alert 실패 시")
                    }
                    
                    Button {
                        alertTitle = "영상이 업로드 성공"
                        alertMessage = "영상이 제대로 올라갔습니다"
                        showAlert3.toggle()
                    } label: {
                        Text("3번 Alert 성공 시")
                    }
                } // : HStack
                .alert(isPresented: $showAlert3) {
                    getAlert3()
                }
                
                // 4번
                HStack (spacing: 10){
                    Button {
                        alertType = .error
                        showAlert4.toggle()
                    } label: {
                        Text("4번 Alert 실패 시")
                    }
                    
                    Button {
                        alertType = .success
                        showAlert4.toggle()
                    } label: {
                        Text("4번 Alert 성공 시")
                    }
                } // : HStack
                .alert(isPresented: $showAlert4) {
                    getAlert4()
                }
                
            }
        } // : VStack
    }
}

struct AlertBasic_Previews: PreviewProvider {
    static var previews: some View {
        AlertBasic()
    }
}
