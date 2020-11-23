//
//  Extension+UserDefaults.swift
//  didik
//
//  Created by Haddawi on 23/11/20.
//

import Foundation

extension UserDefaults {
    enum UserDefaultsKey: String {
        case isLoggedIn
    }
    
    func setIsLoggedIn(state: Bool) {
        set(state, forKey: UserDefaultsKey.isLoggedIn.rawValue)
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKey.isLoggedIn.rawValue)
    }
}
