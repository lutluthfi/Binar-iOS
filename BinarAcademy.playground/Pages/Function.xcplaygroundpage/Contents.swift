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


// Recursive function -> fungsi yang memanggil dirinya sendiri
// Example find factorial
// Using Looping

func loopFactorial() -> Int {
    var number: Int = 7
    var result: Int = 1
    
    if number <= 0 {
        return 1
    }
    
    while number >= 1 {
        result *= number
        number = number - 1
    }
    
    return result
    
}

print(loopFactorial())

// Using Recursive
var number: Int = 7

func recursiveFactorial(_ number: Int) -> Int {
    if number <= 0 {
        return 1
    } else {
        return number * recursiveFactorial(number - 1)
    }
}
print(recursiveFactorial(number))
