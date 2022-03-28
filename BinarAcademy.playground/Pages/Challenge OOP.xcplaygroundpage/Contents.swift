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


protocol FullName {
    var fullName: String { get }

}

class Car {
    var type: string
    var totalTires: Int
    var carClass: String
    var color: String


    init(type: String, totalTires: Int, carClass: String, color: String) {
        self.type = type
        self.carClass = carClass
        self.totalTires = totalTires
        self.color = color
    }
    
    


    
    func identifyCar(type: String) -> String {

        switch type {
        case "SUV":
                 return  "Your car type is SUV"
        case "MPV":
            return  "Your car type is MPV"
        case "Buss":
            return  "Your car type is buss"
        default:
            return "We can't indetify"

        }

    }

}



class Taft: Car, FullName{
    var engine: String

    init(engine: String){
        self.engine = engine
    }

    override func identifyCar(type: String) -> String {
        switch type {
        case "SUV":
            return  "Your car type is SUV"
        case "MPV":
            return  "Your car type is MPV"
        case "Buss":
            return  "Your car type is buss"
        case "diesel":
            return "Your car type is diesel"
        default:
            return "We can't indetify"

        }

    }

}
