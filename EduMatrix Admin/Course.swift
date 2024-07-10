//
//  Course.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 04/07/24.
//

import Foundation

struct Course: Identifiable , Codable{ // Ensure Course conforms to Identifiable
    var id: String
    var email : String
    var name: String
    var description: String
    var duration: String
    var language: String
    var price: String
    var category: String
    var keywords: String
    var imageUrl: String
    var videos: [Video]?
    var notes: [Note]?
    
    func toDictionary() -> [String : Any]{
        return [ "id": id,
                 "email" : email,
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

