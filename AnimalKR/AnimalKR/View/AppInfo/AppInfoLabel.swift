//
//  AppInfoLabel.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/26.
//

import SwiftUI

struct AppInfoLabel: View {
    // property
    let labelText: String
    let labelImage: String
    
    var body: some View {
        HStack {
            Text(labelText.uppercased())
                .fontWeight(.bold)
            
            // 강제로 오른쪽 끝으로 밀어버림
            Image(systemName: labelImage)
                .hTrailing()
        }
    }
}

struct AppInfoLabel_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoLabel(labelText: "AppInfoHead", labelImage: "gear")
    }
}
