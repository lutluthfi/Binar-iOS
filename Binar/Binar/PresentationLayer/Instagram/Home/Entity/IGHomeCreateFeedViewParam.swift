//
//  IGHomeCreateFeedViewParam.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 18/05/22.
//

import Foundation

struct IGHomeCreateFeedViewParam {
    var imageUrl: URL?
    var caption: String = ""
}

extension IGHomeCreateFeedViewParam {
    func toCache() -> IGHomeCreateFeedCacheEntity {
        IGHomeCreateFeedCacheEntity(imageUrl: imageUrl, caption: caption)
    }
}

extension IGHomeCreateFeedCacheEntity {
    func toViewParam() -> IGHomeCreateFeedViewParam {
        IGHomeCreateFeedViewParam(imageUrl: imageUrl, caption: caption)
    }
}
