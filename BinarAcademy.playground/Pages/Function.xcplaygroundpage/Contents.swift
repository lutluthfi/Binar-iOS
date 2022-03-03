//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

func sum(_ a: Int, and b: Int) {
    let res = a + b
    print(res)
}

sum(1, and: 2)
print("res")

// Overloading -> Function yang didefinisikan secara berulang, serupa namun tidak sama
func convert(_ string: String) {
}

func convert(_ int: Int) {
}

func convert(string: String) {
}

func convert(string: String) -> Int {
    Int(string) ?? 0
}

func convert(int: Int) {
}
