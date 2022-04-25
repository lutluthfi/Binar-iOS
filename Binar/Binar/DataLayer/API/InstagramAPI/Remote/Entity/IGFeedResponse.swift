//
//  IGFeedResponse.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 21/04/22.
//

import Foundation

struct IGFeedResponse: Codable {
    let id: String
    let image: String
    let likes: Int
    let tags: [String]
    let text: String
    let publishDate: String
    let owner: IGFeedOwnerResponse
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case image = "image"
        case likes = "likes"
        case tags = "tags"
        case text = "text"
        case publishDate = "publishDate"
        case owner = "owner"
    }
}
