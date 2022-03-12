//: [Previous](@previous)

import Foundation

struct Student {
    let firstName: String
}

class Principle {
    var name: String = ""
    var workAt: School? = nil
    init(name: String) {
        self.name = name
    }
}

class School {
    var name: String
    var principle: Principle? = nil
    
    init(name: String, principle: Principle) {
        self.name = name
        self.principle = principle
    }
}

let john = Principle(name: "John Doe")
var binarSchool: School? = School(name: "Binar", principle: john)
john.workAt = binarSchool
binarSchool = nil

print(john.workAt?.name)
