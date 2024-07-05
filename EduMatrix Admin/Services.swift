import SwiftUI
import Firebase
import FirebaseFirestore

struct PersonalDetailsViewModel{
    

    

    static func fetchData(completion: @escaping ([Educator]) -> Void) {
        var personalDetails: [Educator] = []
        var errorMessage: String? = nil
        var db = Firestore.firestore()
        
        db.collection("personalDetails").getDocuments { (querySnapshot, error) in
            if let error = error {
                errorMessage = "Error getting documents: \(error.localizedDescription)"
            } else {
                personalDetails = querySnapshot?.documents.compactMap { document in
                    let data = document.data()
                    let id = document.documentID
                    let name = data["name"] as? String ?? ""
                    let email = data["email"] as? String ?? ""
                    let mobileNumber = data["mobileNumber"] as? String ?? ""
                    let qualification = data["qualification"] as? String ?? ""
                    let experience = data["experience"] as? String ?? ""
                    let subjectDomain = data["subjectDomain"] as? String ?? ""
                    let language = data["language"] as? String ?? ""
                    return Educator(id: id, name: name, email: email, mobileNumber: mobileNumber, qualification: qualification, experience: experience, subjectDomain: subjectDomain, language: language)
                } ?? []
            }
        }
    }
}
