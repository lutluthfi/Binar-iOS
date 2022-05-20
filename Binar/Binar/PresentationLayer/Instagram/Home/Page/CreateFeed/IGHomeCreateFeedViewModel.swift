//
//  IGHomeCreateFeedViewModel.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 18/05/22.
//

import Foundation

typealias IGHomeCreateFeedViewModelRouter = IGHomeCreateFeedViewModel.Router

final class IGHomeCreateFeedViewModel {
    enum Router {
        case dismiss
        case openImagePicker
    }
    
    typealias OnRouterChanged = (IGHomeCreateFeedViewModelRouter) -> Void
    
    var onRouterChanged: OnRouterChanged?
    
    private(set) var viewParam = IGHomeCreateFeedViewParam()
    
    @UserDefaultsObject<IGHomeCreateFeedCacheEntity>(
        key: "home-create-feed-field-cache"
    ) private(set) var viewParamCache
}

extension IGHomeCreateFeedViewModel {
    func viewWillAppear() {
        if let _viewParamCache = viewParamCache {
            viewParam = _viewParamCache.toViewParam()
        }
    }
    
    func viewWillDisappear() {
        viewParamCache = viewParam.toCache()
    }
    
    func onCancelBarButtonTap() {
        onRouterChanged?(.dismiss)
    }
    
    func onCaptionTextChange(text: String) {
        viewParam.caption = text
    }
    
    func onImageViewTap() {
        onRouterChanged?(.openImagePicker)
    }
    
    func onNextBarButtonTap() {
    }
    
    func onImagePickerFinish(with imageUrl: URL) {
        viewParam.imageUrl = imageUrl
    }
}
