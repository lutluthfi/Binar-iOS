//
//  IGHomeViewModel.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 28/04/22.
//

import Foundation

final class IGHomeViewModel {
    typealias OnLoadFeedsSuccess = ([IGFeedViewParam]) -> Void
    typealias OnLoadFeedsFailure = () -> Void
    
    private let instagramAPI = InstagramAPI(appId: "6249791f9296122eca0475be")
    private let feedCoreDataStorage = IGFeedDataStorage()
    
    @UserDefaultsArrayObject<IGFeedResponse>(key: "bookmark-feeds") private var cacheBookmarkFeeds
    @UserDefaultsArrayObject<IGFeedResponse>(key: "feeds") private var cacheFeeds
    
    private var localFeeds: [IGFeedResponse] = []
    
    var onLoadFeedsSuccess: OnLoadFeedsSuccess?
    var onLoadFeedsFailure: OnLoadFeedsFailure?
    
    private func loadFeeds() {
        if !localFeeds.isEmpty {
            let viewParam: [IGFeedViewParam] = localFeeds.map { $0.toViewParam() }
            onLoadFeedsSuccess?(viewParam)
            return
        }
        
//        if !cacheFeeds.isEmpty {
//            let viewParam = cacheFeeds.map { $0.toViewParam() }
//            onLoadFeedsSuccess?(viewParam)
//            return
//        }
        
        instagramAPI.getFeeds { [weak self] (result) in
            switch result {
            case let .success(data):
                let feeds: [IGFeedResponse] = data.data
                
                self?.feedCoreDataStorage.saveFeeds(feeds)
                
                let viewParam = feeds.map { $0.toViewParam() }
                self?.onLoadFeedsSuccess?(viewParam)
            case .failure:
                self?.onLoadFeedsFailure?()
            }
        }
    }
    
    private func loadLocalFeeds() {
        feedCoreDataStorage.getFeeds { [weak self] r in
            switch r {
            case let .success(result):
                self?.localFeeds = result
            case .failure:
                break
            }
        }
    }
}

// MARK: Accessible Function
extension IGHomeViewModel {
    func viewDidLoad() {
        loadLocalFeeds()
        loadFeeds()
    }
    
    func onBookmarkTap(feed: IGFeedViewParam) {
        guard let feedResponse: IGFeedResponse = cacheFeeds.first(where: {
            $0.id == feed.id
        }) else { return }
        let isExist = cacheBookmarkFeeds.contains(where: { $0.id == feed.id })
        if isExist {
            cacheBookmarkFeeds.removeAll(where: { $0.id == feed.id })
        } else {
            cacheBookmarkFeeds.append(feedResponse)
        }
    }
    
    func isFeedBookmarked(_ feed: IGFeedViewParam) -> Bool {
        cacheBookmarkFeeds.contains(where: { $0.id == feed.id })
    }
}
