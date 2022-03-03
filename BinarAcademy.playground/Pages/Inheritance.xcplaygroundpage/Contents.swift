import Foundation

// Inheritance -> Pewarisan
enum Habitat {
    case ground
    case water
    case mountain
    case swamp
}

class Creature { // Parent Class
    private var name: String = ""
    var habitat: Habitat = .ground
    
    func fromCreature() {
    }
}

class Animal: Creature { // Child Class
}

struct Human: Creature { // Inheritance from non-protocol type
}

let cat = Animal()
cat.habitat
cat.fromCreature()
