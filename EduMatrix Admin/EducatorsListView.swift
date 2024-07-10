//
//  EducatorsListView.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 04/07/24.
//

import SwiftUI

struct EducatorsListView: View {
    @Binding var educators: [Educator]

    var body: some View {
        ScrollView {
            VStack {
                ForEach(educators) { educator in
                    EducatorCardView(educator: educator, onUpdate: { updatedEducator in
                        if let index = educators.firstIndex(where: { $0.id == updatedEducator.id }) {
                            educators.remove(at: index)
                        }
                    })
                }
            }
        }
    }
}

struct EducatorsListView_Previews: PreviewProvider {
    static var previews: some View {
        let educator = Educator(
            name: "Alice Johnson",
            email: "alice.johnson@example.com",
            mobileNumber : "123-456-7890",
            qualification: "PhD in Mathematics",
            experience: "10 years",
            subjectDomain : "Mathematics",
            language: "English, Spanish",
            aadharImageURL: "jdfhlsiear",
            profileImageURL: "sf",
            about: "Passionate about teaching and research in Mathematics."
        )
        EducatorsListView(educators: .constant([educator]))
    }
}
