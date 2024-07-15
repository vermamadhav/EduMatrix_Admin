

import SwiftUI
import FirebaseFirestore

struct RequestsView: View {
    @State private var selectedSegment = 0
    @State private var educators: [Educator] = []
    @State private var courses: [Course] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select a section", selection: $selectedSegment) {
                    Text("Educators").tag(0)
                    Text("Courses").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .padding(.horizontal, 15)
                
                if selectedSegment == 0 {
                    //                    EducatorsListView(educators: educators, onApprove: approveEducator, onReject: rejectEducator)
                    EducatorsListView(educators: $educators)
                } else {
                    CoursesView(courses: $courses)
                }
            }
            .navigationTitle("Requests") // Set navigation title here
        }
        .onAppear(perform: {
            fetchEducators()
            fetchCourses()
        })
    }
    func fetchEducators() {
        let db = Firestore.firestore()
        db.collection("educatorsRequests").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching documents: \(error)")
                return
            }
            guard let documents = snapshot?.documents else {
                print("No documents")
                return
            }
            educators = documents.map { doc -> Educator in
                let data = doc.data()
                return Educator(
                    id: doc.documentID,
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    mobileNumber: data["mobileNumber"] as? String ?? "",
                    qualification: data["qualification"] as? String ?? "",
                    experience: data["experience"] as? String ?? "",
                    subjectDomain: data["subjectDomain"] as? String ?? "",
                    language: data["language"] as? String ?? "",
                    aadharImageURL: data["aadharLink"] as? String ?? "",
                    profileImageURL: data["profileImage"] as? String ?? "",
                    about: data["about"] as? String ?? ""
                )
            }
        }
    }
    func fetchCourses() {
        let db = Firestore.firestore()
        db.collection("coursesRequests").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching documents: \(error)")
                return
            }
            guard let documents = snapshot?.documents else {
                print("No documents")
                return
            }
            courses = documents.map { doc -> Course in
                let data = doc.data()
                return Course(
                    id: data["id"] as? String ?? "",
                    educatorEmail: data["email"] as? String ?? "",
                    educatorName: data["name"] as? String ?? "",
                    //email: data["email"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    description: data["description"] as? String ?? "",
                    duration: data["duration"] as? String ?? "",
                    language: data["language"] as? String ?? "",
                    price: data["price"] as? String ?? "",
                    category: data["category"] as? String ?? "",
                    averageRating: data["averageRating"] as? Double ?? 0.0,
                    keywords: data["keywords"] as? String ?? "",
                    imageUrl: data["imageUrl"] as? String ?? "",
                    videos: nil,
                    notes: nil
                )
            }
        }
    }
}

//struct RequestsView_Previews: PreviewProvider {
//    static var previews: some View {
//        RequestsView()
//    }
//}


 




