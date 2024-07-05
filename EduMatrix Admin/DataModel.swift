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
    let adhaarCard: String
    let about: String
}
