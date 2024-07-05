//
//  EducatorDetailView.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 04/07/24.
//

import SwiftUI

struct EducatorDetailView: View {
    var educator: Educator
    
    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                Text("Name: \(educator.name)")
                Text("Mail: \(educator.email)")
                Text("Phone: \(educator.mobileNumber)")
            }
            
            Section(header: Text("Professional Information")) {
                Text("Qualification: \(educator.qualification)")
//                Text("Skills: \(educator.skills)")
                Text("Experience: \(educator.experience)")
                Text("Subjects/Domains: \(educator.subjectDomain)")
                Text("Languages: \(educator.language)")
//                Text("Aadhaar Card: \(educator.adhaarCard)")
//                Text("About: \(educator.about)")
            }
        }
        .navigationTitle("Educator Details")
    }
}

//struct EducatorDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let educator = Educator(
//            name: "Alice Johnson",
//            email: "alice.johnson@example.com",
//            phone: "123-456-7890",
//            qualification: "PhD in Mathematics",
//            skills: "Calculus, Algebra, Statistics",
//            experience: "10 years",
//            subjects: "Mathematics",
//            languages: "English, Spanish",
//            adhaarCard: "1234-5678-9012",
//            about: "Passionate about teaching and research in Mathematics."
//        )
//        EducatorDetailView(educator: educator)
//    }
//}
