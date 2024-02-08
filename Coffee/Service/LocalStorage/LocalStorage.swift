//
//  LocalStorage.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 04.02.2024.
//

import Foundation

enum UserStorageKey: String {
    case isAuthorization
    case token
}

struct LocalStorage {
    
    private let userDefaults = UserDefaults.standard
    
    static var shared = LocalStorage()
    
    private init() {}
    
    var token: String? {
        get {
            userDefaults.string(forKey: UserStorageKey.token.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: UserStorageKey.token.rawValue)
        }
    }
}
