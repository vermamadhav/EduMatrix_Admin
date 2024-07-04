//
//  LogInView.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 04/07/24.
//

import SwiftUI

struct LogInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isSignIn: Bool = false // Track login status
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Spacer()
                
                ZStack(alignment: .bottomLeading) {
                    Color(hex: "F2F2F7") // Set background color
                        .edgesIgnoringSafeArea(.all) // Ignore safe area to cover entire screen
                    
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
                            .padding(.bottom, 5)
                        Spacer()
                    }
                    .padding(.leading, 20) // Adjust this padding to match the email field's padding
                }
                
                VStack(alignment: .leading, spacing: 26) {
                    TextField("Enter Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .frame(height: 40)
                        .padding(.horizontal, 10)
                    
                    ZStack(alignment: .trailing) {
                        if isPasswordVisible {
                            TextField("Enter Password", text: $password)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .frame(height: 40)
                                .padding(.horizontal, 10)
                        } else {
                            SecureField("Enter Password", text: $password)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .frame(height: 40)
                                .padding(.horizontal, 10)
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
                .padding(.top, 16)
                
                NavigationLink(destination: ContentView()
                    .navigationBarBackButtonHidden(true), isActive: $isSignIn) {
                        EmptyView()
                    }
                
                Button(action: {
                    // Action for login
                    isSignIn = true
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 10)
                }
                .padding(.top, 16)
                .padding(.horizontal, 16)
                
                Spacer()
                    .padding(.bottom)
            }
            
            .navigationBarHidden(true)
        }
        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
