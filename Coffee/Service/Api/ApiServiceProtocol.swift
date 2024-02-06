//
//  ApiServiceProtocol.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 04.02.2024.
//

import Foundation

protocol ApiServiceProtocol {
    func sendAuthenticationRequest(login: String, password: String, isRegistering: Bool, completion: @escaping (Result<TokenResponse, Error>) -> Void)
    func fetchCoffeeShopLocation(completion: @escaping (Result<[LocationModel], Error>) -> Void)
    func fetchCoffee(coffeeShopID: String, completion: @escaping (Result<[CoffeeModel], Error>) -> Void)
}
