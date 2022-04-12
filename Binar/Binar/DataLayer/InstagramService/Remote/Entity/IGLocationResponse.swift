//
//  IGLocationResponse.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 11/04/22.
//

import Foundation

struct IGLocationResponse: Codable {
    let street: String
    let city: String
    let state: String
    let country: String
    let timezone: String
    
    enum CodingKeys: String, CodingKey {
        case street = "street"
        case city = "city"
        case state = "state"
        case country = "country"
        case timezone = "timezone"
    }
}
