//
//  ContentView.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 03/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            RequestsView()
                .tabItem {
                    Label("Requests", systemImage: "tray")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

