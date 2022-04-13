//
//  URLRequestBuilder.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 13/04/22.
//

import Foundation

final class URLRequestBuilder {
    private var request: URLRequest
    
    init(url: URL) {
        request = URLRequest(url: url)
        request.addValue("content-type", forHTTPHeaderField: "application/json")
    }
    
    func appId(_ id: String) -> URLRequestBuilder {
        request.addValue("app-id", forHTTPHeaderField: id)
        return self
    }
    
    func httpMethod(_ method: HttpMethod) -> URLRequestBuilder {
        request.httpMethod = method.rawValue
        return self
    }
    
    func addHeader(key: String, value: String) -> URLRequestBuilder {
        request.addValue(key, forHTTPHeaderField: value)
        return self
    }
    
    func build() -> URLRequest { request }
}
