//
//  URLComponentsBuilder.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 13/04/22.
//

import Foundation

final class URLComponentsBuilder {
    private var component: URLComponents
    private let baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
        component = URLComponents(string: baseUrl)!
    }
    
    func path(_ string: String) -> URLComponentsBuilder {
        let endpoint = baseUrl + string
        component = URLComponents(string: endpoint)!
        return self
    }
    
    func addQuery(key: String, value: String?) -> URLComponentsBuilder {
        guard let value = value else { return self }
        initQueryItemsIfNeed()
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
    
    private func initQueryItemsIfNeed() {
        if component.queryItems == nil {
            component.queryItems = []
        }
    }
}
