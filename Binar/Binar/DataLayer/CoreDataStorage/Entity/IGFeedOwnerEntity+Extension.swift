//
//  IGFeedOwnerEntity+Converter.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 17/05/22.
//

import CoreData

extension IGFeedOwnerEntity {
    @discardableResult convenience init(response: IGFeedOwnerResponse, insertInto context: NSManagedObjectContext) {
        self.init(context: context)
        id = response.id
        firstName = response.firstName
        lastName = response.lastName
        picture = response.picture
    }
}

extension IGFeedOwnerEntity {
    func toRemote() -> IGFeedOwnerResponse {
        IGFeedOwnerResponse(
            id: id ?? "",
            title: "",
            firstName: firstName ?? "",
            lastName: lastName ?? "",
            picture: picture ?? ""
        )
    }
}
