//
//  IGFeedOwnerResponse.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 21/04/22.
//

import Foundation

struct IGFeedOwnerResponse: Codable {
    let id: String
    let title: String
    let firstName: String
    let lastName: String
    let picture: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case firstName = "firstName"
        case lastName = "lastName"
        case picture = "picture"
    }
}
