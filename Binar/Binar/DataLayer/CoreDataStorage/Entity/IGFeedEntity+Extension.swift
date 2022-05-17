//
//  IGFeedEntity+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 17/05/22.
//

import CoreData

extension IGFeedEntity {
    @discardableResult convenience init(response: IGFeedResponse, insertInto context: NSManagedObjectContext) {
        self.init(context: context)
        id = response.id
        image = response.image
        likes = Int64(response.likes)
        ownerId = response.owner.id
        publishDate = response.publishDate
        text = response.text
    }
}

extension IGFeedEntity {
    func toRemote(owner: IGFeedOwnerEntity) -> IGFeedResponse {
        let ownerEntity: IGFeedOwnerResponse = owner.toRemote()
        return IGFeedResponse(
            id: id ?? "",
            image: image ?? "",
            likes: Int(likes),
            tags: [],
            text: text ?? "",
            publishDate: publishDate ?? "",
            owner: ownerEntity
        )
    }
}
