//
//  CoursesView.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 04/07/24.
//

import SwiftUI

struct CoursesView: View {
    // Example course data
    let courses: [Course] = [
        Course(imageName: "course1", name: "SwiftUI Basics", author: "John Doe", duration: "10h", price: "$49"),
        Course(imageName: "course2", name: "Advanced iOS", author: "Jane Smith", duration: "20h", price: "$99"),
        Course(imageName: "course3", name: "UI/UX Design Fundamentals", author: "Alan Johnson", duration: "15h", price: "$79"),
        Course(imageName: "course4", name: "Machine Learning Essentials", author: "Emily Brown", duration: "25h", price: "$129")
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: -20) {
                ForEach(courses) { course in
                    CourseCardView(course: course)
                        .padding(.horizontal, -3) // Set 5-point horizontal padding
                }
            }
            .padding([.top, .bottom], -5) // Set 5-point top and bottom padding
            .background(Color.clear) // Ensure background is clear to avoid overlapping issues
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
