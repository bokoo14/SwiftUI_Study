//
//  FightingView.swift
//  Chulsseuks
//
//  Created by Bokyung on 2023/06/09.
//

import SwiftUI

struct FightingView: View {
    @Binding var nickname: String
    
    var body: some View {
        HStack {
            Text("월클 디벨로퍼 \(nickname).\n오늘도 화이팅하세요!")
                .font(.system(size: 20, weight: .regular))
                .lineSpacing(5)
            Spacer()
        }
        .padding(.vertical, 20)
    }
}

struct FightingView_Previews: PreviewProvider {
    static var previews: some View {
        FightingView(nickname: .constant("Luna"))
    }
}
