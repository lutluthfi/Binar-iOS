//
//  DPDummyDataRespon.swift
//  Binar
//
//  Created by Dimas Purnomo on 09/05/22.
//

import Foundation

struct DPDummyDataResponse<T>: Codable where T: Codable {
    let data: [T]
    let total: Int
    let page: Int
    let limit: Int
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case total = "total"
        case page = "page"
        case limit = "limit"
    }
}
