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
    
    @UserDefaultsArray<String>(key: "bookmark-feed-id") private var storageBookmarkFeedIds
    @UserDefaultsArray<IGFeedResponse>(key: "feeds") private var storageLocalFeeds
    
    var onLoadFeedsSuccess: OnLoadFeedsSuccess?
    var onLoadFeedsFailure: OnLoadFeedsFailure?
    
    private func loadFeeds() {
        if !storageLocalFeeds.isEmpty {
            let viewParam = storageLocalFeeds.map { $0.toViewParam() }
            onLoadFeedsSuccess?(viewParam)
            return
        }
        
        instagramAPI.getFeeds { [weak self] (result) in
            switch result {
            case let .success(data):
                let feeds: [IGFeedResponse] = data.data
                UserDefaultsHelper.standard.feeds = feeds
                let viewParam = feeds.map { $0.toViewParam() }
                self?.onLoadFeedsSuccess?(viewParam)
            case .failure:
                self?.onLoadFeedsFailure?()
            }
        }
    }
}

// MARK: Accessible Function
extension IGHomeViewModel {
    func viewDidLoad() {
        loadFeeds()
    }
    
    func onBookmarkTap(feedId: String) {
        let isExist = storageBookmarkFeedIds.contains(feedId)
        if isExist {
            storageBookmarkFeedIds.removeAll(where: { $0 == feedId })
        } else {
            storageBookmarkFeedIds.append(feedId)
        }
    }
    
    func isFeedBookmarked(_ feed: IGFeedViewParam) -> Bool {
        storageBookmarkFeedIds.contains(feed.id)
    }
}
