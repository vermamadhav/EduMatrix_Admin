//
//  EducatorsView.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 04/07/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct EducatorCardView: View {
    var educator: Educator
    
    var body: some View {
        NavigationLink(destination: EducatorDetailView(educator: educator)) {
            HStack(alignment: .center, spacing: 16) {
                // Profile Picture
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .foregroundColor(.gray)
                    .clipShape(Circle())
                    .padding(.vertical, 8)
                
                // Educator Details
                VStack(alignment: .leading, spacing: 5) {
                    Text(educator.name)
                        .font(.headline)
                        .bold()
                        .foregroundColor(.black) // Set text color to black
                        .lineLimit(1)
                    
                    Text(educator.qualification)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading) // Ensure left alignment
                    
//                    Text(educator.skills)
//                        .font(.subheadline)
//                        .foregroundColor(.secondary)
//                        .lineLimit(3)
//                        .multilineTextAlignment(.leading) // Ensure left alignment
                }
                
                Spacer()
                
                // Approve and Reject Buttons
                VStack(spacing: 8) {
                    Button(action: {
                        // Handle approve action
                        approveEducator()
                    }) {
                        Text("Approve")
                            .frame(width: 85, height: 28)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    
                    Button(action: {
                        // Handle reject action
                        rejectEducator()
                    }) {
                        Text("Reject")
                            .frame(width: 85, height: 28)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .shadow(radius: 3)
            .padding(.horizontal, 5) // Add padding to match the overall layout
        }
    }
    
    private func approveEducator() {
        // Handle approve action
        print("Approved \(educator.name)")
        signUp(email: educator.email , password: "987654321", role: "educator")
    }
    
    private func rejectEducator() {
        // Handle reject action
        print("Rejected \(educator.name)")
    }
    
    func signUp(email: String, password: String, role: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                guard let userID = authResult?.user.uid else { return }
                let db = Firestore.firestore()
                db.collection("users").document(userID).setData([
                    "email": email,
                    "role": role
                ]) { error in
                    if let error = error {
                        print("Error adding document: \(error)")
                    } else {
                        print("User signed up successfully with role: \(role)")
                    }
                }
            }
        }
    }
}

//struct EducatorCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        EducatorCardView(educator: educator)
//    }
//}
