//
//  IGFeedCoreDataStorage.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 16/05/22.
//

import CoreData

final class IGFeedCoreDataStorage {
    let coreDataStorage: CoreDataStorage = .shared
    
    init() {
    }
    
    func clearFeeds(_ feeds: [IGFeedResponse]) {
        coreDataStorage.performBackgroundTask { context in
            do {
                let request: NSFetchRequest = IGFeedEntity.fetchRequest()
                var result = try context.fetch(request)
                result = result.filter { localFeed -> Bool in
                    feeds.contains { $0.id == localFeed.id }
                }
                
                context.deleteAll(result)
            } catch {
                print("IGFeedDataStorage failed to clear feeds caused by \(String(describing: error))")
            }
        }
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
    
    func saveClearFeeds(_ feeds: [IGFeedResponse]) {
        coreDataStorage.performBackgroundTask { context in
            do {
                let feedRequest: NSFetchRequest = IGFeedEntity.fetchRequest()
                let localFeeds = try context.fetch(feedRequest)
                context.deleteAll(localFeeds)
                
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
