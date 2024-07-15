//
//  EducatorCoursesView.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 15/07/24.
//

import Foundation
import SwiftUI
struct EducatorCoursesView: View {
    let educator: Educator
    let courses: [Course]

    var body: some View {
        VStack {
            Text("Courses by \(educator.name)")
                .font(.largeTitle)
                .padding()
            
            List {
                ForEach(courses.filter { $0.educatorName == educator.name }) { course in
                    CourseView(course: course)
                }
            }
        }
        .navigationTitle(educator.name)
    }
}
