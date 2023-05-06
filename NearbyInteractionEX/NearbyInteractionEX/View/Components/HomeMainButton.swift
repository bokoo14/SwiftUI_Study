//
//  HomeMainButton.swift
//  NearbyInteractionEX
//
//  Created by Bokyung on 2023/05/06.
//

import SwiftUI

struct HomeMainButton: View {
    
    @Binding var state: UserState
    var action: () -> Void
    
    init(state: Binding<UserState>, action: @escaping () -> Void) {
        self._state = state
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            if state == .ready {
                Text("ready")
            } else {
                Text("finding or found")
            }
        } // Button

    }
}

struct HomeMainButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading, spacing: 40) {
            HomeMainButton(state: .constant(.ready)) { }
            
            HomeMainButton(state: .constant(.finding)) { }
            
            HomeMainButton(state: .constant(.found)) { }
        }
        .padding(50)
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
    }
}
