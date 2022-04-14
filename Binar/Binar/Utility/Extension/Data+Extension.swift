//
//  Data+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 13/04/22.
//

import Foundation

extension Data {
    func decode<T>(to modelType: T.Type) throws -> T where T: Decodable {
        try JSONDecoder().decode(modelType, from: self)
    }
}
