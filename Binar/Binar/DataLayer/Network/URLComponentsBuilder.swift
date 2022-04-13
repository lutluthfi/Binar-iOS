//
//  URLComponentsBuilder.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 13/04/22.
//

import Foundation

final class URLComponentsBuilder {
    private var component: URLComponents
    
    init(baseUrl: String) {
        component = URLComponents(string: baseUrl)!
        component.queryItems = []
    }
    
    func path(_ string: String) -> URLComponentsBuilder {
        component.path = string
        return self
    }
    
    func addQuery(key: String, value: String?) -> URLComponentsBuilder {
        guard let value = value else { return self }
        let queryItem = URLQueryItem(name: key, value: value)
        component.queryItems?.append(queryItem)
        return self
    }
    
    func addQuery(key: String, value: Int?) -> URLComponentsBuilder {
        guard let value = value else { return self }
        return addQuery(key: key, value: String(value))
    }
    
    func addQuery(key: String, value: Bool?) -> URLComponentsBuilder {
        guard let value = value else { return self }
        return addQuery(key: key, value: String(value))
    }
    
    func build() -> URLComponents { component }
    func buildUrl() -> URL? { component.url }
}
