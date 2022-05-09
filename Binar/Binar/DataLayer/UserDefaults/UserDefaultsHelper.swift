//
//  UserDefaultsHelper.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 27/04/22.
//

import Foundation

final class UserDefaultsHelper {
    static let standard = UserDefaultsHelper()
    
    private init() {
    }
    
    var feeds: [IGFeedResponse] {
        get {
            guard let data = UserDefaults.standard.data(forKey: "feeds") else {
                return []
            }
            let res = try? data.decode(to: [IGFeedResponse].self)
            return res ?? []
        }
        set(newValue) {
            guard let data = try? newValue.encode() else { return }
            UserDefaults.standard.set(data, forKey: "feeds")
        }
    }
}
