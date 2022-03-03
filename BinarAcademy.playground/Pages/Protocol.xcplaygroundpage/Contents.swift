//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

enum Habitat {
    case ground
    case water
    case mountain
    case swamp
}

protocol GrandParent {
}

protocol Parent {
}

protocol Creature { // Abstract or Contract
    var name: String { set get }
    var habitat: Habitat { set get }
    
    func eat(food: String)
}

extension Creature {
    func eat(food: String) {
        print("\(name) will eats \(food)")
    }
}

class Animal: Creature {
    var name: String = ""
    var habitat: Habitat = .ground
    
    func eat(food: String) {
        print("\(name) will eats \(food) on the \(habitat)")
    }
}

struct Human: Creature {
    var name: String = ""
    var habitat: Habitat = .ground
}

class Cat: Animal {
    override func eat(food: String) {
        name = "Cat \(name)"
        print("\(name) will eats \(food) on the \(habitat)")
    }
    
    func meow() {
        print("")
    }
}

class Dog: Animal {
}

class Bird: Animal {
}

func bringToVet(animal: Animal) {
    print("Bring \(animal.name) to Vet")
}

func goesToPark(creature: Creature) {
    print("\(creature.name) goes to Park")
}

var creature: Creature
var animal = Animal()

let cat = Cat()
cat.name = "Tiger"
cat.eat(food: "meat")

creature = cat
animal = cat
creature = animal

creature.name

let dog = Dog()
dog.name = "Bulldog"

creature = dog
animal = dog

let bird = Bird()
bird.name = "Eagle"
bird.eat(food: "snake or fish")

creature = bird
animal = bird

bringToVet(animal: cat)
bringToVet(animal: bird)
bringToVet(animal: dog)

goesToPark(creature: cat)
goesToPark(creature: bird)

