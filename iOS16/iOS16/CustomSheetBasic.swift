//
//  CustomSheetBasic.swift
//  iOS16
//
//  Created by Bokyung on 2023/04/29.
//

import SwiftUI

struct CustomSheetBasic: View {
    /**
     CustomSheet: sheet의 size를 원하는 만큼 변경할 수 있음
     */
    @State var showSheet: Bool = false
    var body: some View {
        Button {
            showSheet.toggle()
        } label: {
            Text("Sheet 보이기")
                .font(.title)
        } // :Button
        .sheet(isPresented: $showSheet) {
            Text("Custom Size Sheet입니다")
                // Custom Size
                .presentationDetents([.small, .medium, .large])// sheet의 size를 조절
                .presentationDragIndicator(.visible)
        } // :sheet
    }
}

// Sheet Size 더 작게 Custom
extension PresentationDetent {
    static let small = Self.height(100)
}

struct CustomSheetBasic_Previews: PreviewProvider {
    static var previews: some View {
        CustomSheetBasic()
    }
}
