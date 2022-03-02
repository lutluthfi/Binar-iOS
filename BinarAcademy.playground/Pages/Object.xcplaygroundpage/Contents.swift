//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Struct / Class
// Struct -> pass by value
// Class  -> pass by reference

class Hewan {
    var jumlahKaki: Int = 0
    var berkembangbiak: String = ""
    var alatGerak: String = ""
    var jenisMakanan: String = ""
}

class Person {
    var firstName: String = ""
    var lastName: String = ""
    var nickName: String = ""
    var address: String = ""
    var age: Int = 0
    var dob: Date = Date()
    var zodiac: String = ""
    var study: String = ""
    var gender: String = ""
    
    var child: Person?
    
    var fullName: String { "\(firstName) \(lastName)" }
    
    deinit {
        print("Child FirstName: \(child?.firstName)")
    }
}

let person2 = Person()
person2.firstName = "Person 2"
var person1: Person? = Person()
person1?.firstName = "Person 1"
person1?.child = person2
print(person1?.firstName)

person1 = nil

//let person1 = Person()
//let person2 = Person()
//person1.child = person2
//person2.firstName = "Person 2"
//person1.child?.firstName == person2.firstName
//print(Unmanaged.passUnretained(person2).toOpaque())
//print(Unmanaged.passUnretained(person1.child!).toOpaque())
//print(Unmanaged.passUnretained(person1).toOpaque())

//person2.firstName = "Person 2"
//person1.firstName = "Person 1"

//print("person1.firstName == person2.firstName")

// open > skip
// public
// internal >
// fileprivate
// private

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
}

//var human1 = Human()
//human1.nickName = "BA"
//
//print(human1.nickName)
//
//func alias(human: Human) {
//    human = Human()
//    human.nickName = "AB"
//}
//
//alias(human: &human1)
//print(human1.nickName) // BA atau AB


//var person1 = Person()
//person1.nickName = "BA"
//print(person1.nickName)
//
//func alias(person: inout Person) {
//    person = Person()
//    person.nickName = "BAAA"
//}
//
//alias(person: &person1)
//print(person1.nickName) // BA atau AB
