//
//  BurgerTubeApp.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 18.12.2021.
//

import SwiftUI
import Firebase

@main
struct BurgerTubeApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
