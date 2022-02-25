//: [Previous](@previous)

import Foundation

func something() -> [String] {
    var res: [String] = []
    defer { print(res) }
    
    guard !res.isEmpty else {
        print("Finish")
        return res
    }
    
    res.append("Binar")
    
    return res
}

// something()

// MARK: - Operator ~=
func operatorBetween() {
    let number = Int.random(in: 0...10)
    if 1...7 ~= number {
        print("random adalah antara 3 sampai dengan 7")
    }
}

operatorBetween()

