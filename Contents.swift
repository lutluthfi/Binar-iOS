//: [Previous](@previous)

import Foundation


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


//: [Next](@next)


// Set -> Intersection, Union, symmetricDifference, substracting

let mobileProgramming: Set = ["Swift", "Java", "Kotlin","Dart","Javascript","Python"]
let webProgramming: Set = ["Javascript", "Typescript", "Ruby", "PHP","Dart","Python"]


// Intersection
let intersection = mobileProgramming.intersection(webProgramming)
print(intersection)
// Union
let union = mobileProgramming.union(webProgramming)
print(union)
// symmetricDifference
let uniques = mobileProgramming.symmetricDifference(webProgramming)
print(uniques)
// substracting
let subtracted = mobileProgramming.subtracting(webProgramming)
print(subtracted)
