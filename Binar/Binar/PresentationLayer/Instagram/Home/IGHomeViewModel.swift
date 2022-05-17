//
//  IGHomeViewModel.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 28/04/22.
//

import Foundation

enum IGHomeRouter {
    case openHomeCreateFeed
}

final class IGHomeViewModel {
    typealias OnLoadFeedsSuccess = ([IGFeedViewParam]) -> Void
    typealias OnLoadFeedsFailure = () -> Void
    typealias OnRouterChanged = (IGHomeRouter) -> Void
    
    private let instagramAPI = InstagramAPI(appId: "6249791f9296122eca0475be")
    private let feedCoreDataStorage = IGFeedCoreDataStorage()
    
    @UserDefaultsArrayObject<IGFeedResponse>(key: "bookmark-feeds") private var cacheBookmarkFeeds
    @UserDefaultsArrayObject<IGFeedResponse>(key: "feeds") private var cacheFeeds
    
    private var localFeeds: [IGFeedResponse] = []
    
    var onLoadFeedsSuccess: OnLoadFeedsSuccess?
    var onLoadFeedsFailure: OnLoadFeedsFailure?
    var onRouterChanged: OnRouterChanged?
    
    private func loadFeeds() {
        if !localFeeds.isEmpty {
            let viewParam: [IGFeedViewParam] = localFeeds.map { $0.toViewParam() }
            onLoadFeedsSuccess?(viewParam)
            return
        }
        
        instagramAPI.getFeeds { [weak self] (result) in
            switch result {
            case let .success(data):
                let feeds: [IGFeedResponse] = data.data
                
                self?.feedCoreDataStorage.saveClearFeeds(feeds)
                
                let viewParam = feeds.map { $0.toViewParam() }
                self?.onLoadFeedsSuccess?(viewParam)
            case .failure:
                self?.onLoadFeedsFailure?()
            }
        }
    }
    
    private func loadLocalFeeds() {
        feedCoreDataStorage.getFeeds { [weak self] result in
            guard case let .success(response) = result else { return }
            self?.localFeeds = response
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
    
    func onPlusBarButtonTap() {
        onRouterChanged?(.openHomeCreateFeed)
    }
    
    func isFeedBookmarked(_ feed: IGFeedViewParam) -> Bool {
        cacheBookmarkFeeds.contains(where: { $0.id == feed.id })
    }
}
