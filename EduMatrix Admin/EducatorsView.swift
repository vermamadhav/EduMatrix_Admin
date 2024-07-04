//
//  EducatorsView.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 04/07/24.
//

import SwiftUI

struct EducatorsView: View {
    // Example educator data
    let educators: [Educator] = [
        Educator(name: "Alice Johnson", email: "alice.johnson@example.com", phone: "123-456-7890", qualification: "PhD in Mathematics", skills: "Calculus, Algebra, Statistics", experience: "10 years", subjects: "Mathematics", languages: "English, Spanish", adhaarCard: "1234-5678-9012", about: "Passionate about teaching and research in Mathematics."),
        Educator(name: "Bob Smith", email: "bob.smith@example.com", phone: "234-567-8901", qualification: "MSc in Computer Science", skills: "iOS Development, Swift, SwiftUI", experience: "8 years", subjects: "Computer Science", languages: "English, French", adhaarCard: "2345-6789-0123", about: "Experienced in iOS development and passionate about teaching new technologies."),
        Educator(name: "Carol White", email: "carol.white@example.com", phone: "345-678-9012", qualification: "MA in English Literature", skills: "Creative Writing, Literature Analysis", experience: "12 years", subjects: "English Literature", languages: "English, German", adhaarCard: "3456-7890-1234", about: "Specialized in creative writing and literature analysis, with extensive teaching experience."),
        Educator(name: "David Brown", email: "david.brown@example.com", phone: "456-789-0123", qualification: "BSc in Physics", skills: "Quantum Mechanics, Thermodynamics, Astrophysics", experience: "15 years", subjects: "Physics", languages: "English, Japanese", adhaarCard: "4567-8901-2345", about: "Dedicated to advancing knowledge in Physics through teaching and research.")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(educators) { educator in
                        EducatorCardView(educator: educator)
                            .padding(.horizontal, 5) // Add padding to match the overall layout
                    }
                }
                .padding(.top, 5)
            }
            //.navigationTitle("Educators")
        }
    }
}

struct EducatorsView_Previews: PreviewProvider {
    static var previews: some View {
        EducatorsView()
    }
}
