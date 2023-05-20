//
//  ShareLinkBasic.swift
//  iOS16
//
//  Created by Bokyung on 2023/05/17.
//

import SwiftUI

struct ShareLinkBasic: View {
    let lunaImage = ImageFile(image: Image("네임카드"))
    
    var body: some View {
        VStack (spacing: 20) {
            ShareLink(item: "https://github.com/bokoo14") {
                Text("링크 Share")
                    .font(.largeTitle)
            }//: ShareLink
            
            // Image ShareLink
            ShareLink(item: lunaImage, preview: SharePreview("Luna의 미모지 카드", image: lunaImage.image)) {
                Text("미모지 공유")
                    .font(.largeTitle)
            }//: ShareLink
            
        }//: VStack
    
    }
}

struct ShareLinkBasic_Previews: PreviewProvider {
    static var previews: some View {
        ShareLinkBasic()
    }
}

struct ImageFile: Transferable {
    var image: Image
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }
}
