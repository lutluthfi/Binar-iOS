//
//  UserDefaults+PropertyWrapper.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 28/04/22.
//

import Foundation

@propertyWrapper struct UserDefaultsArray<Element> {
    let key: String
    var storage: UserDefaults = .standard
    
    init(key: String) {
        self.key = key
    }
    
    var wrappedValue: Array<Element> {
        get { (storage.value(forKey: key) as? Array<Element>) ?? [] }
        set { storage.setValue(newValue, forKey: key) }
    }
}

@propertyWrapper struct UserDefaultsString {
    let key: String
    var storage: UserDefaults = .standard
    
    var wrappedValue: String {
        get { (storage.value(forKey: key) as? String) ?? "" }
        set { storage.setValue(newValue, forKey: key) }
    }
}

@propertyWrapper struct UserDefaultsInteger {
    let key: String
    var storage: UserDefaults = .standard
    
    var wrappedValue: Int {
        get { (storage.value(forKey: key) as? Int) ?? 0 }
        set { storage.setValue(newValue, forKey: key) }
    }
}

@propertyWrapper struct UserDefaultsBoolean {
    let key: String
    var storage: UserDefaults = .standard
    
    var wrappedValue: Bool {
        get { (storage.value(forKey: key) as? Bool) ?? false }
        set { storage.setValue(newValue, forKey: key) }
    }
}
