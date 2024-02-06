//
//  LocationModel.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 03.02.2024.
//

import Foundation

struct LocationModel: Codable {
    let id: Int
    let name: String
    let point: Point
}

struct Point: Codable {
    let latitude: String
    let longitude: String
}
