//
//  IGHomeViewModel.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 28/04/22.
//

import Foundation

typealias IGHomeViewModelRouter = IGHomeViewModel.Router

final class IGHomeViewModel {
    enum Router {
        case openHomeCreateFeed
    }
    
    typealias OnLoadFeedsSuccess = ([IGHomeFeedViewParam]) -> Void
    typealias OnLoadFeedsFailure = () -> Void
    typealias OnRouterChanged = (IGHomeViewModelRouter) -> Void
    
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
            let viewParam: [IGHomeFeedViewParam] = localFeeds.map { $0.toViewParam() }
            onLoadFeedsSuccess?(viewParam)
            return
        }
        
        instagramAPI.getFeeds { [weak self] (result) in
            switch result {
            case let .success(data):
                let feeds: [IGFeedResponse] = data.content
                
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
    
    func onBookmarkTap(feed: IGHomeFeedViewParam) {
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
    
    func isFeedBookmarked(_ feed: IGHomeFeedViewParam) -> Bool {
        cacheBookmarkFeeds.contains(where: { $0.id == feed.id })
    }
}
