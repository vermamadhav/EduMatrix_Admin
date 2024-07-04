//
//  HomeView.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 04/07/24.
//

import SwiftUI

struct HomeView: View {
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
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Educators")
                                .font(.headline)
                            Spacer()
                            Button(action: {}) {
                                Text("See All")
                            }
                        }
                        .padding([.leading, .trailing], 10)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(0..<6) { index in
                                    Circle()
                                        .fill(Color.gray)
                                        .frame(width: 60, height: 60)
                                }
                            }
                            .padding([.leading, .trailing], 10)
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
        }
    }
}

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

