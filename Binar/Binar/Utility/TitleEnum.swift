//
//  TitleEnum.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 30/03/22.
//

import Foundation

protocol TitleEnum {
    var rawTitle: String { get }
}

extension TitleEnum where Self: RawRepresentable, Self.RawValue == String {
    var rawTitle: Self.RawValue {
        var res: String = ""
        for (index, character) in rawValue.enumerated() {
            if index == 0 {
                res = String(character)
                continue
            }
            if character.isUppercase {
                res += " \(character)"
            } else {
                res += String(character)
            }
        }
        return res
    }
}
