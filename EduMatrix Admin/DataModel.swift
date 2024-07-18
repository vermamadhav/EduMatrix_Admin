import Foundation
import FirebaseFirestore

struct Educator : Identifiable, Codable {
    @DocumentID var id: String?
    var fullName: String
    var email: String
    var mobileNumber: String
    var qualification: String
    var experience: String
    var subjectDomain: String
    var language: String
    let aadharImageURL: String
    let profileImageURL : String
    let about: String
    let name: String
    let imageName: String
    
    func toDictionary() -> [String : Any] {
        return [ "fullName": fullName,
                 "email": email,
                 "mobileNumber": mobileNumber,
                 "qualification": qualification,
                 "experience": experience,
                 "subjectDomain": subjectDomain,
                 "language": language,
                 "aadharImageURL": aadharImageURL,
                 "profileImageURL" : profileImageURL,
                 "imageName": imageName,
                 "about": about ]
    }
}

//struct Educator: Identifiable {
//    let id = UUID()
//    let name: String
//    let imageName: String
//}

let educators = [
//    Educator(name: "Mr. Jeetu", imageName: "educator1"),
//    Educator(name: "Mrs. Jaya", imageName: "educator2"),
//    Educator(name: "Ms. Cardi", imageName: "educator3"),
//    Educator(name: "Mr. Kendric", imageName: "educator4"),
//    Educator(name: "Mr. Naman", imageName: "educator5")
    Educator(fullName: "Mr. Jeetu", email: "", mobileNumber: "", qualification: "", experience: "", subjectDomain: "", language: "", aadharImageURL: "", profileImageURL: "", about: "", name: "Mr. Jeetu", imageName: "educator1"),
    Educator(fullName: "Mrs. Jaya", email: "", mobileNumber: "", qualification: "", experience: "", subjectDomain: "", language: "", aadharImageURL: "", profileImageURL: "", about: "", name: "Mrs. Jaya", imageName: "educator2"),
    Educator(fullName: "Ms. Cardi", email: "", mobileNumber: "", qualification: "", experience: "", subjectDomain: "", language: "", aadharImageURL: "", profileImageURL: "", about: "", name: "Ms. Cardi", imageName: "educator3"),
    Educator(fullName: "Mr. Kendric", email: "", mobileNumber: "", qualification: "", experience: "", subjectDomain: "", language: "", aadharImageURL: "", profileImageURL: "", about: "", name: "Mr. Naman", imageName: "educator4")
]

struct Course: Identifiable , Codable{ // Ensure Course conforms to Identifiable
    var title: String
    var imageName: String
    //var rating: Double
    var lessons : Int
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
    var videos: [Video]
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

struct Course1: Identifiable , Codable{ // Ensure Course conforms to Identifiable
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
    var videos: [Video]
    var notes: [Note]?
    
    func toDictionary() -> [String: Any] {
        return [
            "id": id,
            "email": educatorEmail,
            "educatorName" : educatorName,
            "name": name,
            "description": description,
            "duration": duration,
            "language": language,
            "price": price,
            "category": category,
            "keywords": keywords,
            "imageUrl": imageUrl,
            "videos": videos.map { $0.toDictionary() },
            "notes": notes
        ]
    }
}

let courses = [

    Course(title: "Web Development", imageName: "Course1", lessons: 14, id: "", educatorEmail: "", educatorName: "", name: "", description: "", duration: "14h", language: "", price: "1500", category: "", averageRating: 4.5, keywords: "", imageUrl: "Course1", videos: [Video]()),
    Course(title: "Web Development", imageName: "Course1", lessons: 14, id: "", educatorEmail: "", educatorName: "", name: "", description: "", duration: "14h", language: "", price: "1500", category: "", averageRating: 4.5, keywords: "", imageUrl: "Course1", videos: [Video]())
]

let sampleEducators : [Educator] = [Educator(fullName: "dsf", email: "SF", mobileNumber: "b", qualification: "e", experience: "e", subjectDomain: "e", language: "e", aadharImageURL: "e", profileImageURL: "E", about: "E", name: "e", imageName: "e")]

struct Video: Identifiable , Codable{
    var id: UUID
    var title: String
    var videoURL: URL
    
    func toDictionary() -> [String: Any] {
        return [
            "id": id.uuidString,
            "title": title,
            "videoURL": videoURL.absoluteString
        ]
    }
}

struct Note: Identifiable , Codable{
    var id: UUID
    var title: String
    var url: URL
}



