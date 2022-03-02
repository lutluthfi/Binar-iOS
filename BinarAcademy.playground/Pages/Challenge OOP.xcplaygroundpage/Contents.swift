//: [Previous](@previous)

import Foundation
import UIKit

//: [Next](@next)

enum Role {
    case iOSDeveloper,androidDeveloper
}

enum Religion {
  case Islam, Christian, Buddha, other
}

enum Gender {
    case Male, Female
}

enum relationshipStatus{
    case Single, Married, Dating, Engaged, Divorced
}

enum ClotheSize {
    case XS, S, M, L, XL, XXL
}

enum MaritalStatus {
    case Married, NotMarried
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
    var religion: Religion?
    var gender: Gender
    var shirtSize: String?
    var pantsSize: String?
    
       func yourrelationshipStatus(is aChoice: relationshipStatus) {
          switch aChoice {
          case .Single:
            print("Your Status is \(aChoice)")
          case .Married:
            print("Your Status is \(aChoice)")
          case .Dating:
            print("Your Status is \(aChoice)")
          case .Engaged:
            print("Your Status is \(aChoice)")
          case .Divorced:
            print("Your Status is \(aChoice)")
          }
        }
    
    var pantsSizeNumber: Int {
        if pantsSize == "S" {
            return 27
        }
        return 0
    }
    func clothesSize() -> (pantsSizeNumber: Int, shirtSize: String?) {
        return (pantsSizeNumber, shirtSize)
    }
    
    var recommendedInd: Bool { // computed property untuk menentukan individual ini berhak untuk di rekomendasi untuk promosi tambahin juga gpp ngab
        return (yearsOfExperience > 3) && (skinColor == .white && eyeColor == .black)
    }
    
   
    
    init(skinColor: UIColor,eyeColor: UIColor,role: Role,yearsOfExperience: Int, masteredLanguage: Set<String>, gender: Gender) {
        self.skinColor = skinColor
        self.eyeColor = eyeColor
        self.role = role
        self.yearsOfExperience = yearsOfExperience
        self.masteredLanguage = masteredLanguage
        self.gender = gender
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

    func identifyMasteredLanguage(masteredLanguage:  Set<String> = ["Javascript", "swift", "kotlin", "python"]){
        switch Int(masteredLanguage.count) {
        case 0:
                print("You're just starting out")

            case 1:
                print("You just monolingual")

            case 2:
                print("You just bilingual")
            case 3:
                print("You just trilingual")
            case 4:
                print("You just Quadrilingual")
            case 5...:
                print("You just Polyglot")
            default:
                print("Have you done something new?")
            }
        
    }
    
    func printData(){
        var _: String = ""
        var _: Int = 0
        var _: Gender = .Female
        print("\nSkin color : \(skinColor)")
        print("Eye color : \(eyeColor)")
        print("Nation : \(nation!)")
        print("Role : \(role)")
        print("Salary : \(salary!)")
        print("Job level : \(jobLevel!)")
        print("Years of experience : \(yearsOfExperience)")
        print("Mastered Language : \([String](masteredLanguage))")
    }
  
    func yourReligion(is aChoice: Religion) {
      switch aChoice {
      case .Islam:
        print("Your Religion is \(aChoice)")
      case .Christian:
        print("Your Religion is \(aChoice)")
      case .Buddha:
        print("Your Religion is \(aChoice)")
      case .other:
        print("Your Religion is \(aChoice)")
      }
    }

    func continent() -> String{
        if nation! == "Indonesia"{
            print("Indonesia is in Asia")
        }
        return nation!
        }
        
}
let johnCopy = Person(
    skinColor: .white,
    eyeColor: .black,
    role: Role.iOSDeveloper,
    yearsOfExperience: 12,
    masteredLanguage: [],
    gender: .Male
)

let john = Person(
    skinColor: .white,
    eyeColor: .black,
    role: Role.iOSDeveloper,
    yearsOfExperience: 12,
    masteredLanguage: [],
    gender: .Male
)
print("John's Skin Color is \(john.gender)")

let firstName: String = "Binar"
var fullName: String = firstName
fullName = "Academy"
print(firstName)
print(fullName)
print(Unmanaged.passUnretained(firstName as AnyObject).toOpaque())
print(Unmanaged.passUnretained(fullName as AnyObject).toOpaque())

//: [Next](@next)
