//
//  IGDataResponse.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 11/04/22.
//

import Foundation

struct IGDataResponse<T>: Codable where T: Codable {
    let content: [T]
    let total: Int
    let page: Int
    let limit: Int
    
    enum CodingKeys: String, CodingKey {
        case content = "data"
        case total = "total"
        case page = "page"
        case limit = "limit"
    }
}
