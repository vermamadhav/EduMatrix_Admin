//
//  RequestsView.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 04/07/24.
//

import SwiftUI

struct RequestsView: View {
    @State private var selectedSegment = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select a section", selection: $selectedSegment) {
                    Text("Educators").tag(0)
                    Text("Courses").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                if selectedSegment == 0 {
                    EducatorsListView()
                } else {
                    CoursesView()
                }
            }
            .navigationTitle("Requests") // Set navigation title here
        }
    }
}

struct RequestsView_Previews: PreviewProvider {
    static var previews: some View {
        RequestsView()
    }
}







