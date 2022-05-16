//
//  InstagramAPI.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 11/04/22.
//

import Alamofire
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
        page: Int? = nil,
        completion: @escaping (Result<IGDataResponse<IGFeedResponse>, AFError>) -> Void
    ) {
        let endpoint: String = Self.baseUrl + "/post"
        var params: [String: Any] = [:]
        params["limit"] = limit
        params["page"] = page
        var headers: HTTPHeaders = [:]
        headers["app-id"] = appId
        AF.request(
            endpoint,
            method: .get,
            parameters: params,
            encoding: URLEncoding.default,
            headers: headers
        ).responseDecodable(of: IGDataResponse<IGFeedResponse>.self) { response in
            completion(response.result)
        }
    }
    
    func getUsers(
        limit: Int? = nil,
        page: Int? = nil,
        completion: @escaping (Result<IGDataResponse<IGUserShortResponse>, Error>) -> Void
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
    
    func getDetailUser(
        id: String,
        _ completion: @escaping (Result<IGUserResponse,Error>) -> Void
    ) {
        let url: URL? = urlComponentBuilder
            .path("/user/\(id)")
            .buildUrl()
        
        guard let url = url else {
            fatalError("\(Self.self) has a request error URL")
        }
        
        let request: URLRequest = URLRequestBuilder(url: url)
            .appId(appId)
            .httpMethod(.GET)
            .build()
        
        URLSession.shared.dataTask(for: IGUserResponse.self, with: request, completion: completion)
            .resume()
    }
}
