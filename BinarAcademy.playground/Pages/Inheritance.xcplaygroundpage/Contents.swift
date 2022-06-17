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
    //Can't override var because it set as final
//    override var fullName: String { "Animal - \(name)" }
    
    override func fromCreature() {
    }
}

//Can't inheritance Struct from Class
//struct Human: Creature {
    // Inheritance from non-protocol type
//}

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


// Keyword Super


class Human {
    var name: String = ""
    
    func aboutPerson(){
        print("Hi my name \(name)")
    }
}

class Person: Human {
    var npm: String = ""
    
    override func aboutPerson() {
        super.aboutPerson()
        print("I am study Pakuan University with registation number \(npm)")
    }
}

var akbar = Human()
//akbar.npm - tidak bisa

protocol NumberProtocol {
    func doSomething()
}

enum Number: Int, NumberProtocol {
    case one = 1
    case two = 2
    case three = 3
    
    func doSomething() {
        
    }
}


class Vehicle {
    private let key: String = "12345"
    var color: String = "Light Gray"
    var numberOfWheel: Int = 4
    
    func aboutVehicle() {
        print("Key is \(key)")
    }
    
    func driveSpeed() {
        print("Drive speed at 50 km/h")
    }
}

class Bicycle: Vehicle {
    override func driveSpeed() {
        print("Drive speed at 10 km/h")
    }
}

class Car: Vehicle {
    override func driveSpeed() {
        print("Drive speed at 60 km/h")
    }
}

class Truck: Vehicle {
}

let jazzCar = Car()
jazzCar.color = "Black"
jazzCar.driveSpeed()
jazzCar.aboutVehicle()

let kijangCar = Car()
kijangCar.driveSpeed()

let polygonBicycle = Bicycle()
polygonBicycle.color
polygonBicycle.driveSpeed()

let mitsubishiTruck = Truck()
mitsubishiTruck.color
mitsubishiTruck.driveSpeed()

class Parent {
    let eyeColor = "Red"
}

class Child: Parent {
}

let hannah = Child()
hannah.eyeColor
