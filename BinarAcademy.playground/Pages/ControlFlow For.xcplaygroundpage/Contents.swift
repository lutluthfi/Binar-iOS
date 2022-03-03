import Foundation

// Array
func arrayLoop() {
    let names = ["Anna", "Alex", "Brian", "Jack"]
    for (index, element) in names.enumerated() where element.contains("B") {
        print("hello, \(names[index]) & \(element)!")
    }
}

// Dictionary
func dictionaryLoop() {
    let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
    for (animalName, legCount) in numberOfLegs {
        print("\(animalName)s have \(legCount) legs")
    }
}

// Number
func numberLoop() {
    for number in 1...5 {
        print("\(number) times 5 is \(number * 5)")
    }
}

func numberLoop2() {
    let minutes = 60
    for minute in stride(from: 0, to: minutes, by: 1) where minute % 5 == 0 {
        print(" 1 minute \(minute)")
    }
    for minute in stride(from: 0, to: minutes, by: 5) {
        print(" 2 minute \(minute)")
    }
}

// Variable
func variableLoop(limit: Int) {
    for number in 1...limit {
        print("number \(number)")
    }
}

// Brak
func loopBreak() {
    var isFound = false
    for number in 1...100 {
        print(number)
        if number % 20 == 0 {
            isFound = true
            break
        }
    }
    print(isFound)
}

// Continue
func loopContinue() {
    for number in 1...100 {
        if number % 2 == 0 {
            continue
        }
        print(number)
    }
}

func findMin() {
    let array = [4, 6, 7, 1, 2, 5, 8, -1]
    var res = array[0]
    for number in array where number > res {
        print(number)
        res = number
    }
    print("---")
    var res2 = array[0]
    for number in array {
        print(number)
        if number > res2 {
            res2 = number
        }
    }
    print("hasil: \(res) & \(res2)")
}

findMin()
