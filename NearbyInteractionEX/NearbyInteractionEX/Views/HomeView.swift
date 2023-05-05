//
//  HomeView.swift
//  NearbyInteractionEX
//
//  Created by Bokyung on 2023/05/05.
//

import SwiftUI

struct HomeView: View {
    let localNetAuth = LocalNetworkAuthorization()
    
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
