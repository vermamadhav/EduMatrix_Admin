//
//  ContentView.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 03/07/24.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            RequestsView()
                .tabItem {
                    Image(systemName: "book.fill")
                }
        }
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("User signed in successfully")
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

