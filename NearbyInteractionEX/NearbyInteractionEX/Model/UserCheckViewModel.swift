//
//  UserCheckViewModel.swift
//  NearbyInteractionEX
//
//  Created by Bokyung on 2023/05/06.
//

import SwiftUI

// user가 준비되었는지 체크
class UserCheckViewModel: ObservableObject {
    @Published var isUserReady: Bool = false
}
