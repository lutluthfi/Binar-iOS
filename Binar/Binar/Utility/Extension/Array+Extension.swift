//
//  Array+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 22/04/22.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        get {
            let indexInRange = startIndex <= index && index < endIndex
            if indexInRange {
                return self[index]
            } else {
                return nil
            }
        }
        set(newValue) {
            let indexInRange = startIndex <= index && index < endIndex
            guard let _newValue = newValue, indexInRange else {
                print("⚠️ do not pass nil value while using safe subscript or potentially index out range")
                return
            }
            self[index] = _newValue
        }
    }
}
