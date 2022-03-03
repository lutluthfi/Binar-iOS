import Foundation
import UIKit

// Inheritance -> Pewarisan
// Purpose -> Untuk mengurangi redundant code
enum Habitat {
    case ground
    case water
    case mountain
    case swamp
}

class Creature { // Parent Class
    var name: String = ""
    var habitat: Habitat = .ground
    final var fullName: String { name }
    
    func fromCreature() {
    }
    
    final func onlyCreature() {
    }
}

class Animal: Creature { // Child Class
    override var fullName: String { "Animal - \(name)" }
    
    override func fromCreature() {
    }
}

struct Human: Creature { // Inheritance from non-protocol type
}

let cat = Animal()
cat.habitat
cat.fromCreature()

class Component {
    var frame: CGRect = .zero
    var backgroundColor: UIColor = .white
    var text: String = ""
}

class Button: Component {
    func onTap() {
    }
}

class Label: Component {
}

let signInButton = Button()
signInButton.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
signInButton.backgroundColor = .blue
signInButton.text = "Sign In"
signInButton.onTap()

let titleLabel = Label()
titleLabel.text = "Title App"
