//
//  IGFeedViewParam.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 28/04/22.
//

import Foundation

struct IGFeedViewParam {
    let id: String
    let username: String
    let avatarUrlString: String
    let pictureUrlString: String
    let caption: String
    let numberOfLikes: Int
}

extension IGFeedResponse {
    func toViewParam() -> IGFeedViewParam {
        let username: String = [owner.firstName, owner.lastName].joined(separator: ".")
        return IGFeedViewParam(
            id: id,
            username: username,
            avatarUrlString: owner.picture,
            pictureUrlString: image,
            caption: text,
            numberOfLikes: likes
        )
    }
}
