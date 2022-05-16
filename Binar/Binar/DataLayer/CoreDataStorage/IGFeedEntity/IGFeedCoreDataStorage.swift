//
//  IGFeedCoreDataStorage.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 16/05/22.
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

extension IGFeedOwnerEntity {
    @discardableResult convenience init(response: IGFeedOwnerResponse, insertInto context: NSManagedObjectContext) {
        self.init(context: context)
        id = response.id
        firstName = response.firstName
        lastName = response.lastName
        picture = response.picture
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

final class IGFeedDataStorage {
    let coreDataStorage: CoreDataStorage = .shared
    
    init() {
    }
    
    func getFeeds(maxCount: Int = 0, completion: @escaping (Result<[IGFeedResponse], Error>) -> Void) {
        coreDataStorage.performBackgroundTask { context in
            do {
                let ownerRequest: NSFetchRequest = IGFeedOwnerEntity.fetchRequest()
                let ownerLocals: [IGFeedOwnerEntity] = try context.fetch(ownerRequest)
                
                let request: NSFetchRequest = IGFeedEntity.fetchRequest()
                if maxCount > 0 {
                    request.fetchLimit = maxCount
                }
                
                let feedEntity: [IGFeedEntity] = try context.fetch(request)
                let res: [IGFeedResponse] = feedEntity.map { entity -> IGFeedResponse? in
                    let owner: IGFeedOwnerEntity? = ownerLocals.first(where: { $0.id == entity.ownerId })
                    if let _owner = owner {
                        let res: IGFeedResponse = entity.toRemote(owner: _owner)
                        return res
                    } else {
                        return nil
                    }
                }.compactMap { $0 }
                
                completion(.success(res))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func saveFeeds(_ feeds: [IGFeedResponse]) {
        coreDataStorage.performBackgroundTask { context in
            do {
                for feed in feeds {
                    IGFeedEntity(response: feed, insertInto: context)
                    IGFeedOwnerEntity(response: feed.owner, insertInto: context)
                }
                try context.save()
            } catch {
                print("IGFeedDataStorage failed to save feeds caused by \(String(describing: error))")
            }
        }
    }
}
