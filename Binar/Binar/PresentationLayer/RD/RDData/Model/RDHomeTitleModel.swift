//
//  RDModels.swift
//  Binar
//
//  Created by Raden Dimas on 08/04/22.
//

import UIKit

enum RDHomeTitleModel: String,CaseIterable {
    case challengeWeek3
    case challengeWeek4
    case challengeWeek5
    case challengeWeek6
    
    static var sorted: [RDHomeTitleModel] {
        RDHomeTitleModel.allCases.sorted {
            $0.rawValue < $1.rawValue
        }.map { $0 }
    }
}


