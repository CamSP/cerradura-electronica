//
//  cerraduraApp.swift
//  cerradura
//
//  Created by Camilo Zambrano on 1/02/22.
//

import SwiftUI
import Firebase
import GoogleSignIn


class FirestoreManager: ObservableObject {
    
}
@main
struct cerraduraApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            login().environmentObject(AppViewModel())
        }
    }
}
