//
//  HomeView.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 04/07/24.
//

import SwiftUI

struct HomeView: View {
    @State private var courses: [Course] = sampleCourses
    @State private var educatorsList : [Educator] = sampleEducators
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Home")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                        Image(systemName: "person.circle")
                            .font(.title)
                    }
                    .padding([.leading, .trailing], 10)
                    .padding(.top, 20)
                    
                    TextField("Search educators...", text: .constant(""))
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Spacer()
                                Image(systemName: "mic.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 10)
                            }
                        )
                        .padding([.leading, .trailing], 10)
                    
                    VStack(alignment: .leading) {
                        Text("Personal DashBoard")
                            .font(.headline)
                            .padding([.leading, .trailing], 10)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Profit")
                                    .font(.subheadline)
                                Text("01 Mar 2021 - 16 Mar 2021")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text("INR 5,40,000")
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                            Spacer()
                            PieChartView()
                                .frame(width: 100, height: 100)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding([.leading, .trailing], 10)
                    }
                    
                    
                    // Categories
                    HStack {
                        Text("Educators")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                        NavigationLink(destination: OnboardedEducatorListView(educators: educatorsList)) {
                            Text("See All")
                                .foregroundColor(Color.primaryColor)
                        }
                    }
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(educatorsList) { educator in
                                NavigationLink(destination: EducatorCoursesView(educator: educator, courses: courses)) {
                                    EducatorView(educator: educator)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .onAppear{
                        Services.fetchListOfEducators(){
                            educators in
                            self.educatorsList = educators
                        }
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Categories of Educators")
                                .font(.headline)
                            Spacer()
                            Button(action: {}) {
                                Text("See All")
                            }
                        }
                        .padding([.leading, .trailing], 10)
                        
                        ForEach(["Subject Matter Expert", "Instructional Designers", "Tutors", "Course Instructors", "Mentors", "Technical Trainers"], id: \.self) { category in
                            NavigationLink(destination: Text(category)) {
                                HStack {
                                    Image(systemName: "rectangle.stack.person.crop")
                                        .foregroundColor(.black)
                                    Text(category)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .padding([.leading, .trailing], 10)
                            }
                        }
                    }
                }
                .padding(.bottom, 20)
            }
            .navigationBarHidden(true)
            .navigationTitle("Home")
        }
    }
}




// Sample Data
let sampleCourses: [Course] = [
    Course(
        id: "1",
        educatorEmail: "email",
        educatorName: "Prakash Sharma",
        name: "Web Development",
        description: "Learn web development from scratch.",
        duration: "12h 52m",
        language: "English",
        price: "Rs.1,500",
        category: "Coding",
        averageRating: 4.0,
        keywords: "web, development",
        imageUrl: "https://media.geeksforgeeks.org/wp-content/uploads/20230331172641/NodeJS-copy.webp",
        videos: [Video(id: UUID(),title: "Intro", videoURL: URL(string: "https://example.com/intro.mp4")!)],
        notes: [Note(id: UUID(), title: "Note 1", url: URL(string: "https://example.com/note1.pdf")!)]
    ),
    
    Course(
        id: "2",
        educatorEmail: "gmial",
        educatorName: "Instructor Name",
        name: "Complete Swift ",
        description: "Course description here.",
        duration: "10h 20m",
        language: "English",
        price: "Rs.1,200",
        category: "Tech",
        averageRating: 4.0,
        keywords: "Coding, skills",
        imageUrl: "https://i.ytimg.com/vi/NIJLFZk9SdA/hq720.jpg?sqp=-oaymwEXCK4FEIIDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLA_XpfR4VFvwAGUwnN2JdQ34-g76g",
        videos: [Video(id: UUID(), title: "Lesson 1", videoURL: URL(string: "https://example.com/lesson1.mp4")!)],
        notes: [Note(id: UUID(),title: "Note 2", url: URL(string: "https://example.com/note2.pdf")!)]
    ),
    
    Course(
        id: "2",
        educatorEmail: "hotmail",
        educatorName: "Instructor Name",
        name: "Another Course",
        description: "Course description here.",
        duration: "10h 20m",
        language: "English",
        price: "Rs.1,200",
        category: "Business",
        averageRating: 4.0,
        keywords: "business, skills",
        imageUrl: "https://i.ytimg.com/vi/NIJLFZk9SdA/hq720.jpg?sqp=-oaymwEXCK4FEIIDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLA_XpfR4VFvwAGUwnN2JdQ34-g76g",
        videos: [Video(id: UUID(), title: "Lesson 1", videoURL: URL(string: "https://example.com/lesson1.mp4")!)],
        notes: [Note(id: UUID(), title: "Note 2", url: URL(string: "https://example.com/note2.pdf")!)]
    )
]

let sampleEducators: [Educator] = [
    Educator(
        fullName: "reload",
        email: "",
        mobileNumber: "",
        qualification: "",
        experience: "",
        subjectDomain: "",
        language: "",
        aadharImageURL: "",
        profileImageURL: "",
        about: ""
    )
]

struct PieChartView: View {
    var body: some View {
        // Placeholder for your pie chart
        Circle()
            .strokeBorder(Color.gray, lineWidth: 2)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

