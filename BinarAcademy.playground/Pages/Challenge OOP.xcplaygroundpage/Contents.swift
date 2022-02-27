//: [Previous](@previous)

import Foundation
import UIKit

//: [Next](@next)

enum Role {
    case iOSDeveloper,androidDeveloper
}


class Person {
    var skinColor: UIColor
    var eyeColor: UIColor
    var nation: String?
    var role: Role
    var salary: Double?
    var jobLevel: String?
    var yearsOfExperience: Int
    var masteredLanguage: Set<String>
    
   
    
    init(skinColor: UIColor,eyeColor: UIColor,role: Role,yearsOfExperience: Int, masteredLanguage: Set<String>) {
        self.skinColor = skinColor
        self.eyeColor = eyeColor
        self.role = role
        self.yearsOfExperience = yearsOfExperience
        self.masteredLanguage = masteredLanguage
    }
    
    private func countSalary(n: Int) -> Double? {
        if role == .iOSDeveloper {
            if n > 5 {
                var resSalary = self.salary ?? 0.0
                resSalary += 20000000.600
                salary = resSalary
                countSalary(n: n - 5)
                return salary
            } else {
                var resSalary = self.salary ?? 0.0
                resSalary += Double(n) * 2500000
                salary = resSalary
                return salary
            }
        } else {
            if n > 5 {
                var resSalary = self.salary ?? 0.0
                resSalary += 18000000.600
                salary = resSalary
                countSalary(n: n - 5)
                return salary
            } else {
                var resSalary = self.salary ?? 0.0
                resSalary += Double(n) * 2200000
                salary = resSalary
                return salary
            }
        }
    }

    
    func identifyPerson() -> (resNation:String?,resSalary:Double?,resJobLevel: String?) {
        
        let resultNation = identifyNation()
        let resultJobLevel = identifyJobLevel()
        let resultSalary = countSalary(n: yearsOfExperience)
        
        
        return ( resultNation,resultSalary,resultJobLevel )
    }
    
    private func identifyJobLevel() -> String? {
        if yearsOfExperience > 5 {
            jobLevel = "Lead"
        } else if yearsOfExperience < 5 && yearsOfExperience > 3 {
            jobLevel = "Senior"
        } else {
            jobLevel = "Junior"
        }
        return jobLevel
       
    }
    
    
    private func identifyNation() -> String? {
        if skinColor == .white && eyeColor == .black {
            nation = "Indonesia"
        } else {
            nation = "Not Indonesia"
        }
        
        return nation
    }
    
    func addMasteredLanguage(mastering: String) {
        masteredLanguage.insert(mastering)
    }
}

let indonesian = Person(skinColor: .white,eyeColor: .black,role: Role.iOSDeveloper,yearsOfExperience: 12, masteredLanguage: [])

print(indonesian.identifyPerson())






//: [Next](@next)
