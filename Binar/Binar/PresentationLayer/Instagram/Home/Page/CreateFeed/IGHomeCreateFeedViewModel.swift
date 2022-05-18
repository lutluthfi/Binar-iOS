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
}

extension IGHomeCreateFeedViewModel {
    func onCancelBarButtonTap() {
        onRouterChanged?(.dismiss)
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
