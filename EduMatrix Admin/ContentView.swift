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
                    Text("Home")
                }
                .padding(.leading, 10)
                .padding(.top, 5)
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            Button(action: {
                signIn(email: email, password: password)
            }) {
                Text("Sign In")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(25)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
            }
            .padding(.top, 16)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            
            
            RequestsView()
                .tabItem {
                    Label("Requests", systemImage: "tray")
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

