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


sayHello(greeting:"Hello", names: "Jon", "Kara", "Swift", "Mas Tio")

//Hello Jon
//Hello Kara
//Hello Swift
//Hello Mas Tio


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
