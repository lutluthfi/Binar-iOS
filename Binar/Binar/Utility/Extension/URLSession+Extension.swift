//
//  URLSession+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 13/04/22.
//

import Foundation

extension URLSession {
    func dataTask<Response>(
        for responseType: Response.Type,
        with request: URLRequest,
        completion: @escaping (Result<Response, Error>) -> Void
    ) -> URLSessionDataTask where Response: Decodable {
        print("🚀 Start Request URL: \(String(describing: request.url))")
        print("🔘 HttpMethod: \(String(describing: request.httpMethod))")
        for (key, value) in request.allHTTPHeaderFields ?? [:] {
            print("🔘 Headers: \(key) > \(value)")
        }
        return URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            } else if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
                    print(json)
                    
                    let res = try data.decode(to: responseType)
                    DispatchQueue.main.async {
                        completion(.success(res))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            } else {
                DispatchQueue.main.async {
                    let error = NSError(domain: "URLSession general error for request: \(request)", code: 0)
                    completion(.failure(error))
                }
            }
            print("🏁 Finish Request URL: \(String(describing: request.url))")
        }
    }
}
