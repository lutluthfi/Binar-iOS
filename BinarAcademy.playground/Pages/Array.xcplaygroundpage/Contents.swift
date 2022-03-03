//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"
greeting = String(greeting.dropLast(2))
//: [Next](@next)

var fruits: [String] = ["apple", "orange", "mango", "banana"]
var names: [String] = ["alfa", "beta", "carli", "delta"]
var numbers: [Int] = [1, 2, 3, 4, 5]

fruits.append("durian")
fruits.append("watermelon")

func tambahBuah(_ input: Int) -> [String] {
    var fruits: [String] = ["apple", "orange", "mango", "banana"]
    if input % 2 == 0 {
        fruits.append("orange")
    } else {
        fruits.removeLast()
    }
    return fruits
}

tambahBuah(10)
//
// Case Sensitive => aa != AA != Aa != aA
// Case Insensitive => aa == AA == Aa == aA
//
//
