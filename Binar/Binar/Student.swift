//
//  Student.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 14/03/22.
//

import Foundation

enum Student: String, CaseIterable {
    case NurhasanNanda
    case AkbarIdris
    case TioHardadi
    case ZakiKaren
    case AdjiFirmansyah
    case DwikyMaulana
    case DhaniBukhory
    case NurinBerlianna
    case AdrianKurniawan
    case MaulanaFrasha
    case BagasIlham
    case TatangSulaeman
    case RandySetiawann
    case DimasPurnomo
    case NuzululAthaya
    case PranaApsara
    case AiedylDava
    case YudaAqil
    case Daffashiddiq
    case RadenDimas
    case WidyaAyu
    case ArifLuthfi
    
    static var sorted: [Student] {
        Student.allCases.sorted { $0.rawValue < $1.rawValue }
    }
    
    var name: String {
        var res: String = ""
        var secondWordIndex: Int = 0
        for (index, char) in rawValue.enumerated() {
            secondWordIndex = index
            if char.isUppercase && secondWordIndex != 0 {
                res += " \(char)"
            } else {
                res += String(char)
            }
        }
        return res
    }
}
