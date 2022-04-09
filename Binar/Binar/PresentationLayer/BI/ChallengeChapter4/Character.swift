//
//  Character.swift
//  Challenge 4
//
//  Created by Bagas on 09/04/22.
//

import UIKit

enum SpecialAbility: String, CaseIterable, Decodable {
    case driving = "Driving"
    case shooting = "Shooting"
    case rage = "Rage"
    case none = "None"
}

enum CharacterColor: String, CaseIterable, Decodable {
    case green
    case blue
    case orange
    case none
    case last
}

struct GameCharacter {
    
    let firstName: String
    let lastName: String
    lazy var fullName: String = firstName + " " + lastName
    let description: String
    let specialAbility: SpecialAbility
    let imageURLString: String
    let characterColor: CharacterColor
    
    init(firstName: String, lastName: String, description: String, specialAbility: SpecialAbility, imageURLString: String, characterColor: CharacterColor) {
        self.firstName = firstName
        self.lastName = lastName
        self.description = description
        self.specialAbility = specialAbility
        self.imageURLString = imageURLString
        self.characterColor = characterColor
    }
    
}
