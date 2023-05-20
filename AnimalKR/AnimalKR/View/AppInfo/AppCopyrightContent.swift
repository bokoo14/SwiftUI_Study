//
//  AppCopyrightContent.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/26.
//

import SwiftUI

struct AppCopyrightContent: View {
    // property
    var image: String
    
    // optional property
    var copyrightText: String?
    var linkLabel: String?
    var linkDestination: String?
    var linkImage: String?
    
    var body: some View {
        
        VStack {
            Divider().padding(.vertical, 5)
            
            HStack (spacing: 10){
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: CGFloat.screenWidth * 0.3)
                
                if (copyrightText != nil) {
                    // copyrightText가 존재하면 Text를 보여줌
                    Text(copyrightText ?? "noValue")
                        .font(.footnote)
                        .hTrailing()
                } else if (linkLabel != nil && linkDestination != nil && linkImage != nil) {
                    // linkLabel, linkDestination, linkImage 모두 있으면 
                    Link(destination: URL(string: "https://\(linkDestination!)")!) {
                        Text(linkLabel ?? "noValue")
                            .font(.footnote)
                        Image(systemName: linkImage ?? "arrow.up.right.square")
                            .foregroundColor(.accentColor)
                            .font(.footnote)
                    } // :Link
                } // :if, else if
            } // :HStack
        } // :VStack
        
    }
}

struct AppCopyrightContent_Previews: PreviewProvider {
    static var previews: some View {
        AppCopyrightContent(image: "appicon", copyrightText: "저작권법 제24조의2(공공저작물의 자유이용)에 따라 한국문화정보원에서 저작재산권의 전부를 보유하고 있거나 자유이용허락표시에 대한 권리자의 동의를 받은 경우는 “공공저작물 자유이용허락표시기준(공공누리, KOGL)”을 부착하여 별도의 이용허락 없이 자유이용이 가능합니다." )
    }
}
