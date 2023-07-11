//
//  ContentView.swift
//  FirebaseTest
//
//  Created by Bokyung on 2023/07/06.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

// singleton Database
let firebaseDB = ContentView().db

struct ContentView: View {
    // Cloud Firestore 인스턴스 초기화
    var db = Firestore.firestore()
    
    var body: some View {
        VStack {
            MakeGroupView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
