//
//  PermissionCheckView.swift
//  NearbyInteractionEX
//
//  Created by Bokyung on 2023/05/06.
//

import SwiftUI

struct PermissionCheckView: View {
    var body: some View {
        
        VStack(spacing: 30) {
            Button {
                if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color.blue)
                        .frame(maxWidth: .infinity).frame(height: 50)
                    
                    Text("설정 바로가기")
                        .foregroundColor(.black)
                }
            }
            
        }
        .padding(.horizontal, 20)
        .preferredColorScheme(.dark)
        
        
        
    }
}

struct PermissionCheckView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionCheckView()
    }
}
