//: [Previous](@previous)

import Foundation

class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Person {
    var name: String
}

let rose = User(name: "Roses")
rose.name = "Rose Red"

let violet = rose
violet.name = "Violet Blue"

print(rose.name)
print(violet.name)

