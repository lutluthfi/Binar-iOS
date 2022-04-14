//
//  Encodable+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 13/04/22.
//

import Foundation

extension Encodable {
    func encode() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
