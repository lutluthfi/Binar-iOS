//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
// Code Modularization

struct Human {
    let firstName: String
    var lastName: String = ""
    var address: String = ""
    let dateOfBirth: Date
    var zodiac: String = ""
    var study: String = ""
    var gender: String = ""
}

// Khusus menghitung umur
extension Human {
    var age: Int {
        let today = Date()
        let calendar = Calendar.current
        let age: Int? = calendar.dateComponents([.year], from: dateOfBirth, to: today).year
        return age ?? 0
    }
}

// Name
extension Human {
    var fullName: String { "\(firstName) \(lastName)" }
    
    // Binar -> BI
    // Binar Academy -> BA
    var nickName: String {
        guard let firstCharFirstName = firstName.first,
              let firstCharLastName = lastName.first
        else {
            return String(firstName.prefix(2)).uppercased()
        }
        return "\(firstCharFirstName)\(firstCharLastName)".uppercased()
    }
}

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd MM yyyy"
let dateOfBirth = dateFormatter.date(from: "11 01 2000") ?? Date()
var binar = Human(firstName: "Binar", dateOfBirth: dateOfBirth)
print(binar.age)
print(binar.nickName)
binar.lastName = "Academy"
print(binar.nickName)
