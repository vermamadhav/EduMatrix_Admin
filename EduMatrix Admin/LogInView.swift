//import SwiftUI
//import FirebaseAuth
//import FirebaseFirestore
//
//struct LoginView: View {
//    @State private var email = ""
//    @State private var password = ""
//    @State private var isPasswordVisible = false
//    @State private var isSignIn: Bool = false
////    @EnvironmentObject var viewRouter: ViewRouter
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                // Illustration
//                Image("login") // Replace with your actual image name
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: 250)
//                    .padding(.top, 30)
//                
//                Text("Log in")
//                    .font(.largeTitle)
//                    .bold()
//                
//                // Email field
//                TextField("Email address", text: $email)
//                    .padding()
//                    .background(Color(.secondarySystemBackground))
//                    .cornerRadius(5.0)
//                    .autocapitalization(.none)
//                    .keyboardType(.emailAddress)
//                    .overlay(
//                        HStack {
//                            Spacer()
//                            if email.hasSuffix("@gmail.com") {
//                                Image(systemName: "checkmark.circle.fill")
//                                    .foregroundColor(.blue)
//                                    .padding()
//                            }
//                        }
//                    )
//                    .padding(.top, 20)
//                
//                // Password field
//                HStack {
//                    if isPasswordVisible {
//                        TextField("Password", text: $password)
//                    } else {
//                        SecureField("Password", text: $password)
//                    }
//                    Button(action: {
//                        isPasswordVisible.toggle()
//                    }) {
//                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
//                            .foregroundColor(.gray)
//                    }
//                }
//                .padding()
//                .background(Color(.secondarySystemBackground))
//                .cornerRadius(5.0)
//                .padding(.top, 10)
//                
//                // Forgot password
//                HStack {
//                    Spacer()
//                    NavigationLink(destination: ForgotPasswordView()) {
//                        Text("Forgot password?")
//                            .font(.body)
//                            .foregroundColor(.blue)
//                    }
//                }
//                .padding(.top, 5)
//                
//                // Login button
//                Button(action: {
//                    // Action for login
//                    checkLoginCredentials(email: email, password: password)
//                    
//                    
//                }) {
//                   
//                    Text("Log in")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(width: 220, height: 50)
//                        .background(Color.blue)
//                        .cornerRadius(10.0)
//                        .padding(.top, 20)
//
//                }
//               NavigationLink(destination: ContentView(), isActive: $isSignIn) {
//                    EmptyView()
//                }
//          Spacer(minLength: 50)
//            }
//            .padding(.horizontal, 30)
//            .navigationBarHidden(true)
//        }
//    }
//    
//    func checkLoginCredentials(email: String, password: String) {
//        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//            } else {
//                let db = Firestore.firestore()
//                let docRef = db.collection("admins").document(email)
//                
//                docRef.getDocument { (document, error) in
//                    if let document = document, document.exists {
//                        isSignIn = true
//                        print("User signed in successfully")
////                        viewRouter.currentPage = .contentView
//                    } else {
//                        print("User role mismatch. Expected: Admin")
//                        do {
//                            try Auth.auth().signOut()
//                        } catch let signOutError as NSError {
//                            print("Error signing out: \(signOutError)")
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct ContentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    @State private var isSignIn: Bool = false
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationView {
            VStack {
                // Illustration
                Image("login") // Replace with your actual image name
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .padding(.top, 30)

                Text("Log in")
                    .font(.largeTitle)
                    .bold()

                // Email field
                TextField("Email address", text: $email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .overlay(
                        HStack {
                            Spacer()
                            if email.isEmpty {
                                Image(systemName: "")
                                    .padding()
                            }
                           else if isValidEmail(email) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.blue)
                                    .padding()
                            }
                            else{
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.red)
                                    .padding()
                            }
                        }
                    )
                    .padding(.top, 20)

                // Password field
                HStack {
                    if isPasswordVisible {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
                    }
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5.0)
                .padding(.top, 10)

                // Forgot password
                HStack {
                    Spacer()
                    NavigationLink(destination: ForgotPasswordView()) {
                        Text("Forgot password?")
                            .font(.body)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.top, 5)

                // Login button
                Button(action: {
                    // Validate and check login credentials
                    if validateCredentials(email: email, password: password) {
                        checkLoginCredentials(email: email, password: password)
                    }
                }) {
                    Text("Log in")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10.0)
                        .padding(.top, 20)
                }
                
                NavigationLink(destination: ContentView(), isActive: $isSignIn) {
                    EmptyView()
                }
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 30)
            .navigationBarHidden(true)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Invalid Input"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
//            
//            .onAppear(){
//                do {
//                    try Auth.auth().signOut()
//                    // Navigate back to login or initial screen
////                    viewRouter.currentPage = .loginView // Adjust as per your ViewRouter setup
//                } catch let signOutError as NSError {
//                    print("Error signing out: \(signOutError.localizedDescription)")
//                }
//            }
        }
    }

    func validateCredentials(email: String, password: String) -> Bool {
        if email.isEmpty || !isValidEmail(email) {
            alertMessage = "Please enter a valid email address."
            showAlert = true
            return false
        }

        if password.isEmpty || password.count < 6 {
            alertMessage = "Password must be at least 6 characters long."
            showAlert = true
            return false
        }

        return true
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }

    func checkLoginCredentials(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                alertMessage = error.localizedDescription
                showAlert = true
                return
            } else {
                let db = Firestore.firestore()
                let docRef = db.collection("admins").document(email)

                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                        isSignIn = true
                        print("User signed in successfully")
                    } else {
                        print("User role mismatch. Expected: Admin")
                        do {
                            try Auth.auth().signOut()
                        } catch let signOutError as NSError {
                            print("Error signing out: \(signOutError)")
                        }
                        alertMessage = "User role mismatch. Expected: Admin"
                        showAlert = true
                    }
                }
            }
        }
    }
}

struct ContentsView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
