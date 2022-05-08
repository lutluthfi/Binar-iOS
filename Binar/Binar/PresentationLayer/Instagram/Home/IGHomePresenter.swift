//
//  IGHomePresenter.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 28/04/22.
//

import Foundation

final class IGHomePresenter {
    typealias OnLoadFeedsSuccess = ([IGFeedViewParam]) -> Void
    typealias OnLoadFeedsFailure = () -> Void
    
    private let instagramAPI = InstagramAPI(appId: "6249791f9296122eca0475be")
    
    @UserDefaultsArray<String>(key: "bookmark-feed-id") private var bookmarkFeedIds
    @UserDefaultsArray<IGFeedResponse>(key: "feeds") private var localFeeds
    
    var onLoadFeedsSuccess: OnLoadFeedsSuccess?
    var onLoadFeedsFailure: OnLoadFeedsFailure?
    
    func viewDidLoad() {
        loadFeeds()
    }
    
    private func loadFeeds() {
        if !localFeeds.isEmpty {
            let viewParam = localFeeds.map { $0.toViewParam() }
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
