//
//  DummyAPI.swift
//  Binar
//
//  Created by Dimas Purnomo on 08/05/22.
//

import Foundation



final class DPDummyAPI {
    
    enum HttpMethod: String {
        case GET
        case POST
        case PUT
        case DELETE
        case PATCH
    }
    
    static let baseUrl = "https://dummyapi.io/data/v1"
    
    private let appId: String
    private let urlComponentBuilder = URLComponentsBuilder(baseUrl: DPDummyAPI.baseUrl)
    
    init(appId: String) {
        self.appId = appId
    }
    
    func getUsers(
        limit: Int? = nil,
        page: Int? = nil,
        completion: @escaping (Result<DPDummyDataResponse<DPDummyUserShortResponse>, Error>) -> Void
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
            for: DPDummyDataResponse<DPDummyUserShortResponse>.self,
            with: request,
            completion: completion
        ).resume()
    }
    
}
