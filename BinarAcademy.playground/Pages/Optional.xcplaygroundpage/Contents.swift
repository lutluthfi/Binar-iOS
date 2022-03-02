//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

var number: Double = 11.0
var _number = Int(number)


//Using variadic parameters
func sayHello(greeting: String, names: String...) {
    for name in names {
        print("\(greeting) \(name)")
    }
}

func sayHi(names: [String]) {
    for name in names {
        print("Hi \(name)")
    }
}

var firstName: String = ""
var lastName: String = ""
var email: String = ""

var names: [String] = []
if greeting == "Hi" {
    names.append(firstName)
}
sayHi(names: names)

sayHello(greeting: "Hello", names: firstName, lastName, email)
sayHello(greeting:"Hello", names: "Jon", "Kara", "Swift")
sayHello(greeting: "Hello", names: "")

//Hello Jon
//Hello Kara


//inout parameters
func reverse(first: inout String, second: inout String) {
    let tmp = first
    first = second
    second = tmp
}

var one = "One"
var two = "Two"
reverse(first: &one, second: &two)
print("one: \(one) two: \(two)")
