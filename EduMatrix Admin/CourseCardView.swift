//
//  CoursesView.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 04/07/24.
//

import SwiftUI

struct CourseCardView: View {
    var course: Course
    
    var body: some View {
        VStack(alignment: .leading) {
            // Course Banner Image
            Image(course.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .cornerRadius(12)
            
            // Course Details
            HStack {
                VStack(alignment: .leading) {
                    Text(course.name)
                        .font(.headline)
                        .bold()
                    
                    Text("By \(course.author)")
                        .font(.subheadline)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(course.price)
                        .font(.headline)
                        .bold()
                    
                    Text("Duration: \(course.duration)")
                        .font(.subheadline)
                        //.bold()
                }
                
                
                
            }
            .padding([.horizontal, .top])
            
            // Approve and Reject Buttons
            HStack {
                Button(action: {
                    // Handle approve action
                    approveCourse()
                }) {
                    Text("Approve")
                        .frame(width: 85, height: 28)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.bottom, 5)
                
                Spacer()
                
                Button(action: {
                    // Handle reject action
                    rejectCourse()
                }) {
                    Text("Reject")
                        .frame(width: 85, height: 28)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.bottom, 5)
            }
            .padding([.horizontal, .bottom])
        }
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 3)
        .padding()
    }
    
    private func approveCourse() {
        // Handle approve action
        print("Approved \(course.name)")
    }
    
    private func rejectCourse() {
        // Handle reject action
        print("Rejected \(course.name)")
    }
}

struct CourseCardView_Previews: PreviewProvider {
    static var previews: some View {
        let course = Course(imageName: "course1", name: "SwiftUI Basics", author: "John Doe", duration: "10h", price: "$49")
        CourseCardView(course: course)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
