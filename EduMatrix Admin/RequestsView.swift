//
//  RequestsView.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 04/07/24.
//

import SwiftUI
import FirebaseFirestore

struct RequestsView: View {
    @State private var selectedSegment = 0
    @State private var educators: [Educator] = []
    
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
                    EducatorsListView(educators1: educators)
                } else {
                    CoursesView()
                }
            }
            .navigationTitle("Requests") // Set navigation title here
        }
        .onAppear(perform: fetchEducators)
    }
    func fetchEducators() {
            let db = Firestore.firestore()
            db.collection("educatorsRequests").getDocuments { snapshot, error in
                if let error = error {
                    print("Error fetching documents: \(error)")
                } else {
                    educators = snapshot?.documents.compactMap { doc in
                        let data = doc.data()
                        return Educator(
                            id: doc.documentID,
                            name: data["name"] as? String ?? "",
                            email: data["email"] as? String ?? "",
                            mobileNumber: data["mobileNumber"] as? String ?? "",
                            qualification: data["qualification"] as? String ?? "",
                            experience: data["experience"] as? String ?? "",
                            subjectDomain: data["subjectDomain"] as? String ?? "",
                            language: data["language"] as? String ?? ""
                        )
                    } ?? []
                }
            }
        }
}

struct RequestsView_Previews: PreviewProvider {
    static var previews: some View {
        RequestsView()
    }
}


 




