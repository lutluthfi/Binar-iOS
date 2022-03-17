//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
struct Human {
    var firstName: String = ""
    var lastName: String = ""
    var nickName: String = ""
    var address: String = ""
    var age: Int = 0
    var dob: Date = Date()
    var zodiac: String = ""
    var study: String = ""
    var gender: String = ""
    
    var fullName: String { "\(firstName) \(lastName)" }
    
    subscript(greetings: String) -> String {
        "\(greetings), \(nickName)"
    }
    
    subscript() -> Int {
        get {
            age
        }
        set {
            age += newValue
        }
    }
    
    subscript() -> String {
        get {
            firstName
        }
        set {
            firstName += " \(newValue)"
        }
    }
}

var binar = Human(firstName: "Binar", lastName: "Academy", nickName: "Binar")
print(binar["Hi!"])
binar[] = "Playground"
binar[] = 1
let age: Int = binar[]
let firstName: String = binar[]
print(age)
