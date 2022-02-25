import Foundation

// Array
func arrayLoop() {
    let names: [String?] = ["Anna", "Alex", "Brian", "Jack", nil]
    
    let greetings = names.compactMap { $0 }.map { "Hi \($0)" }
    print(greetings)
}

// arrayLoop()

// Dictionary
func dictionaryLoop() {
    let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
    numberOfLegs.forEach { (animalName, legCount) in
        print("\(animalName)s have \(legCount) legs")
    }
}
