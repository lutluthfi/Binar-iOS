//
//  InstagramAPI.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 11/04/22.
//

import Foundation

enum HttpMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
    case PATCH
}

final class InstagramAPI {
    static let baseUrl = "https://dummyapi.io/data/v1"
    
    private let appId: String
    private let urlComponentBuilder = URLComponentsBuilder(baseUrl: InstagramAPI.baseUrl)
    
    init(appId: String) {
        self.appId = appId
    }
    
    func getFeeds(
        limit: Int? = nil,
        page: Int? = nil
    ) {
        let url: URL? = urlComponentBuilder.path("/post")
            .addQuery(key: "limit", value: limit)
            .addQuery(key: "page", value: page)
            .buildUrl()
        
        guard let url = url else {
            fatalError("\(Self.self) has a request but invalid URL")
        }
        
        let request: URLRequest = URLRequestBuilder(url: url)
            .appId(appId)
            .httpMethod(.GET)
            .build()
        
//        URLSession.shared.dataTask(
//            for: IGDataResponse<IGUserResponse>.self,
//            with: request,
//            completion: completion
//        ).resume()
    }
    
    func getUsers(
        limit: Int? = nil,
        page: Int? = nil,
        _ completion: @escaping (Result<IGDataResponse<IGUserShortResponse>, Error>) -> Void
    ) {
        let url: URL? = urlComponentBuilder
            .path("/user")
            .addQuery(key: "limit", value: limit)
            .addQuery(key: "page", value: page)
            .buildUrl()
        
        guard let url = url else {
            fatalError("\(Self.self) has a request but invalid URL")
        }
        
        let request: URLRequest = URLRequestBuilder(url: url)
            .appId(appId)
            .httpMethod(.GET)
            .build()
        
        URLSession.shared.dataTask(
            for: IGDataResponse<IGUserShortResponse>.self,
            with: request,
            completion: completion
        ).resume()
    }
}
