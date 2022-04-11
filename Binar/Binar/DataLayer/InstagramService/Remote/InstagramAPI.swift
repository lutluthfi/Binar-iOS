//
//  InstagramAPI.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 11/04/22.
//

import Foundation

final class InstagramAPI {
    static let baseUrl = "https://dummyapi.io/data/v1"
    
    private let appId: String
    
    init(appId: String) {
        self.appId = appId
    }
    
    func getUsers(
        limit: Int? = nil,
        page: Int? = nil,
        _ completion: @escaping (Result<IGDataResponse<IGUserResponse>, Error>) -> Void
    ) {
        var urlComponent = URLComponents(string: Self.baseUrl)
        urlComponent?.path = "/user"
        
        var queries: [URLQueryItem] = []
        if let limit = limit {
            let queryItem = URLQueryItem(name: "limit", value: String(limit))
            queries.append(queryItem)
        }
        if let page = page {
            let queryItem = URLQueryItem(name: "page", value: String(page))
            queries.append(queryItem)
        }
        urlComponent?.queryItems = queries
        
        guard let url: URL = urlComponent?.url else {
            fatalError("\(Self.self) has a request but invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("app-id", forHTTPHeaderField: appId)
        request.addValue("content-type", forHTTPHeaderField: "application/json")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let res = try JSONDecoder().decode(IGDataResponse<IGUserResponse>.self, from: data)
                    completion(.success(res))
                } catch {
                    completion(.failure(error))
                }
            } else {
                print("unknown error")
            }
        }
        task.resume()
    }
}
