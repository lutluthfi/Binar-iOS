//
//  BIGameCharacter.swift
//  Binar
//
//  Created by Bagas Ilham on 22/05/22.
//

import UIKit

enum BISpecialAbility: String, CaseIterable, Decodable {
    case driving = "Driving"
    case shooting = "Shooting"
    case rage = "Rage"
    case none = "None"
}

enum BICharacterColor: String, CaseIterable, Decodable {
    case green
    case blue
    case orange
    case none
    case last
}

struct BIGameCharacter {
    
    let firstName: String
    let lastName: String
    var fullName: String { firstName + " " + lastName }
    let description: String
    let specialAbility: BISpecialAbility
    let imageURLString: String
    let characterColor: BICharacterColor
    
    init(firstName: String, lastName: String, description: String, specialAbility: BISpecialAbility, imageURLString: String, characterColor: BICharacterColor) {
        self.firstName = firstName
        self.lastName = lastName
        self.description = description
        self.specialAbility = specialAbility
        self.imageURLString = imageURLString
        self.characterColor = characterColor
    }
    
}
