import Foundation
import FirebaseFirestore

struct Educator : Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var email: String
    var mobileNumber: String
    var qualification: String
    var experience: String
    var subjectDomain: String
    var language: String
    let aadharImageURL: String
    let profileImageURL : String
    let about: String
    
    func toDictionary() -> [String : Any] {
        return [ "name": name,
                 "email": email,
                 "mobileNumber": mobileNumber,
                 "qualification": qualification,
                 "experience": experience,
                 "subjectDomain": subjectDomain,
                 "language": language,
                 "aadharImageURL": aadharImageURL,
                 "profileImageURL" : profileImageURL,
                 "about": about ]
    }
}

//import SwiftUI
//Color(hex: "F2F2F7") // Set background color
//    .edgesIgnoringSafeArea(.all) // Ignore safe area to cover entire screen

//extension Color {
//    init(hex: String) {
//        let scanner = Scanner(string: hex)
//        var rgbValue: UInt64 = 0
//        
//        scanner.scanHexInt64(&rgbValue)
//        
//        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
//        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
//        let blue = Double(rgbValue & 0x0000FF) / 255.0
//        
//        self.init(red: red, green: green, blue: blue)
//    }
//}
