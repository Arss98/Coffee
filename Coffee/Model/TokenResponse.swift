//
//  TokenResponse.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 04.02.2024.
//

import Foundation

struct TokenResponse: Codable {
    let token: String
    let tokenLifetime: Int
}
