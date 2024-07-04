//
//  ContentView.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 03/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LoginView()
    }
}

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            ZStack(alignment: .bottomLeading) {
                Image("admin_avatar") // Replace with your image name
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250) // Adjust height as needed
                    .clipped()

                HStack {
                    Text("Log In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        //.shadow(color: .gray, radius: 2, x: 0, y: 2)
                        .padding(.bottom, 5)
                    Spacer()
                }
                .padding(.leading, 20) // Adjust this padding to match the email field's padding
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Email")
                    .font(.headline)
                    .padding(.leading,10)
                
                TextField("Enter Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .frame(height: 40)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                
                Text("Password")
                    .font(.headline)
                    .padding(.leading,10)
                
                ZStack(alignment: .trailing) {
                    if isPasswordVisible {
                        TextField("Enter Password", text: $password)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(10)
                            .frame(height: 50)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                    } else {
                        SecureField("Enter Password", text: $password)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .frame(height: 40)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                    }
                    
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                            .padding(.trailing, 18)
                    }
                }
                Button(action: {
                    // Action for forgot password
                }) {
                    Text("Forgot Password?")
                        .foregroundColor(.blue)
                }
                .padding(.leading, 10)
                .padding(.top, 5)
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            Button(action: {
                // Action for login
            }) {
                Text("Sign In")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(25)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
            }
            .padding(.top, 16)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            
            
//            Button(action: {
//                // Action for login with Google
//            }) {
//                Text("Continue with Google")
//                    .foregroundColor(.blue)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 25)
//                            .stroke(Color.blue, lineWidth: 1)
//                    )
//                    .padding(.leading, 10)
//                    .padding(.trailing, 10)
//            }
//            
//            .padding(.top,0)
//            .padding(.leading, 16)
//            .padding(.trailing, 16)
//            
            Spacer()
            .padding(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
