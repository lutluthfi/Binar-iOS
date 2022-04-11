//
//  IGUserResponse.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 11/04/22.
//

import Foundation

struct IGUserResponse: Codable {
    let id: String
    let title: String
    let firstName: String
    let lastName: String
    let picture: String
    let gender: String
    let email: String
    let dateOfBirth: String
    let phone: String
    let location: IGLocationResponse
    let registerDate: String
    let updatedDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case firstName = "firstName"
        case lastName = "lastName"
        case picture = "picture"
        case gender = "gender"
        case email = "email"
        case dateOfBirth = "dateOfBirth"
        case phone = "phone"
        case location = "location"
        case registerDate = "registerDate"
        case updatedDate = "updatedDate"
    }
}
