//
//  Course.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 04/07/24.
//

import Foundation

struct Course: Identifiable { // Ensure Course conforms to Identifiable
    var id = UUID() // Add an id property
    
    var imageName: String
    var name: String
    var author: String
    var duration: String
    var price: String
}


