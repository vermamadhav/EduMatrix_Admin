//
//  EducatorModel.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 04/07/24.
//

import Foundation

struct Educator: Identifiable {
    let id = UUID()
    let name: String
    let email: String
    let phone: String
    let qualification: String
    let skills: String
    let experience: String
    let subjects: String
    let languages: String
    let adhaarCard: String
    let about: String
}

