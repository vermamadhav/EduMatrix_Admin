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

struct Course: Identifiable , Codable{ // Ensure Course conforms to Identifiable
    var id: String
    var educatorEmail : String
    var educatorName: String
    var name: String
    var description: String
    var duration: String
    var language: String
    var price: String
    var category: String
    var averageRating: Double
    var keywords: String
    var imageUrl: String
    var videos: [Video]?
    var notes: [Note]?
    
    func toDictionary() -> [String : Any]{
        return [ "id": id,
                 "email" : educatorEmail,
                 "name": name,
                 "description": description,
                 "duration": duration,
                 "language": language,
                 "price": price,
                 "category": category,
                 "keywords": keywords,
                 "imageUrl": imageUrl,
                 "videos": videos,
                 "notes": notes ]
    }
}

struct Video: Identifiable , Codable{
    var id: UUID
    var title: String
    var url: URL
}

struct Note: Identifiable , Codable{
    var id: UUID
    var title: String
    var url: URL
}



