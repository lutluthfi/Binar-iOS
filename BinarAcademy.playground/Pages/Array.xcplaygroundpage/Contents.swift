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


// zip -> merge two of arrays

let array1: [String] = ["test1","test2","test3","test4"]
//let array2: ClosedRange<Int> = 1...5
let array3: [Int] = [1,3,4,5]
let array4: Set = ["test1","test2"]
let array5: Set = [1.0,5.4,6.6]

let zipped = Array(zip(array4, array5))
print(zipped)
