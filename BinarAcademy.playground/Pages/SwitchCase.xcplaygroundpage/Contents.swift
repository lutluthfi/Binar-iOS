//: [Previous](@previous)

import Foundation

// MARK: - String
//var scoreString = "B+"
//switch scoreString {
//case "A":
//    print("10")
//case "B+":
//    print("8")
//case "B":
//    print("7")
//case "C+":
//    print("6")
//case "C":
//    print("5")
//default:
//    print("Unknown")
//}

// MARK: - Number
var scoreNumber = 10
switch scoreNumber {
case 9..<10:
    print("A")
case 8:
    print("B")
case 7:
    print("C")
case 6:
    print("D")
case 5:
    print("E")
default:
    print("Unknown")
}

// MARK: - Tuple
//let tuple = (0, "Binar Academy")
//switch tuple {
//case (0, "Binar"): print("Benar")
//case let (x, "Binar"): print("Binar")
//case (let x, let string): print("\(x) \(string)")
//}
