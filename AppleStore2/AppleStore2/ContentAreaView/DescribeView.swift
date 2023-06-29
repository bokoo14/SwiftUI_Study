//
//  DescribeView.swift
//  AppleStore2
//
//  Created by Bokyung on 2023/06/25.
//

import SwiftUI

struct DescribeView: View {
    var body: some View {
        ScrollView {
            VStack (spacing: 20){
                imageLayout(imageTitle: "ImgContentL01", overlayAlignment: .top, leadingOffset: 0, topOffset: 40) {
                    Text("채드도 놀란")
                        .foregroundColor(Color("ColorFontWhite"))
                        .font(.system(size: 20, weight: .bold))
                        .border(.red)

                    Text("iPhone 14 Pro")
                        .foregroundColor(Color("ColorFontWhite"))
                        .font(.system(size: 30, weight: .bold))
                        .border(.red)
                }
                
                imageLayout(imageTitle: "ImgContentL02", overlayAlignment: .top, leadingOffset: 0, topOffset: 40) {
                    Text("Dynamic Island")
                        .foregroundColor(Color("ColorFontWhite"))
                        .font(.system(size: 20, weight: .medium))
                        .border(.red)

                    Text("iPhone을 다루는 완전히\n새로운 방법")
                        .foregroundColor(Color("ColorFontWhite"))
                        .multilineTextAlignment(.center)
                        .font(.system(size: 24, weight: .bold))
                        .border(.red)
                }
                
                imageLayout(imageTitle: "ImgContentSm01", overlayAlignment: .topLeading, leadingOffset: 37, topOffset: 40) {
                    Text("그 모든걸\n가능케 하는\n브레인.")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color("ColorFontPurpleTop"), Color("ColorFontPurpleDown")],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    .border(.red)
                }
                
                imageLayout(imageTitle: "ImgContentSm02", overlayAlignment: .center, leadingOffset: 0, topOffset: 0) {
                    Text("오래 가는 배터리")
                        .font(.system(size: 22, weight: .bold))
                        .border(.red)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color("ColorFontPurpleTop"), Color("ColorFontPurpleDown")],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .padding(.bottom, 10)
                    Text("온종일,\n올인.")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 54, weight: .bold))
                        .lineSpacing(5)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color("ColorFontPurpleTop"), Color("ColorFontPurpleDown")],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .border(.red)
                }
                
                
                imageLayout(imageTitle: "ImgContentL03", overlayAlignment: .top, leadingOffset: 0, topOffset: 40) {
                    Text("상시표시형 디스플레이.\n잠긴 동안에도\n잠드는 법 없이.")
                        .font(.system(size: 24, weight: .bold))
                        .border(.red)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color("ColorFontPurpleTop"), Color("ColorFontPurpleDown")],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .multilineTextAlignment(.center)
                }
                
                imageLayout(imageTitle: "ImgContentL04", overlayAlignment: .top, leadingOffset: 0, topOffset: 42) {
                    Text("Ceramic Shield")
                        .font(.system(size: 20, weight: .medium))
                        .border(.red)
                        .foregroundColor(Color("ColorFontWhite"))
                        .multilineTextAlignment(.center)
                    
                    Text("그 어떤 스마트폰\n글래스보다 견고한 소재.")
                        .font(.system(size: 24, weight: .bold))
                        .border(.red)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color("ColorFontPurpleTop"), Color("ColorFontPurpleDown")],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .multilineTextAlignment(.center)
                }
            } // VStack
        } // ScrollView
       
    }
}

struct DescribeView_Previews: PreviewProvider {
    static var previews: some View {
        DescribeView()
    }
}

// ultrathinmaterial
