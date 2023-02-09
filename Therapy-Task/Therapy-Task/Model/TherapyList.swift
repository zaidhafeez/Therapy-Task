//
//  TherapyList.swift
//  Therapy-Task
//
//  Created by Mohammad Zaid on 10/02/23.
//

import Foundation

// MARK: - TherapyList
struct TherapyList: Codable {
    let status: Int
    let success: Bool
    let message, token: String
    let therapyList: [TherapyListDetail]
    
    enum CodingKeys: String, CodingKey {
        case status, success
        case message, token
        case therapyList = "data"
    }
    
}

// MARK: - TherapyListDetail
struct TherapyListDetail: Codable {
    let id: Int
    let name, imageNm: String
    let imagePath: ImagePath
    let profile: String
    let status: Status
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageNm = "image_nm"
        case imagePath = "image_path"
        case profile, status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

enum ImagePath: String, Codable {
    case uploadsTherapies = "/uploads/therapies/"
    case uploadsTherapist = "/uploads/therapist/"
}

enum Status: String, Codable {
    case active = "Active"
}
