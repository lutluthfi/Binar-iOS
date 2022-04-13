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
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let res = try data.decode(to: Response.self)
                    completion(.success(res))
                } catch {
                    completion(.failure(error))
                }
            } else {
                let error = NSError(domain: "URLSession general error for request: \(request)", code: 0)
                completion(.failure(error))
            }
        }
    }
}
