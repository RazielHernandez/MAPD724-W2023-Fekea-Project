//
//  FakeaApp.swift
//  Fakea
//
//  Created by Oscar Miralles on 2023-03-25.
//

import SwiftUI
import FirebaseCore
import SwiftUI
import FirebaseFirestore

@main
struct FakeaApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
    }
}
