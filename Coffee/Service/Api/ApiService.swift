//
//  ApiService.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 04.02.2024.
//

import Foundation
import Alamofire

final class ApiService: ApiServiceProtocol {
    func fetchCoffee(coffeeShopID: String, completion: @escaping (Result<[CoffeeModel], Error>) -> Void) {
        let url = "http://147.78.66.203:3210/location/\(coffeeShopID)/menu"
        let headers: HTTPHeaders = ["accept": "application/json", "Authorization": "Bearer \(LocalStorage.shared.token.orEmpty)"]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseDecodable(of: [CoffeeModel].self) { response in
                print(response.result)
                switch response.result {
                case .success(let coffee):
                    completion(.success(coffee))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchCoffeeShopLocation(completion: @escaping (Result<[LocationModel], Error>) -> Void) {
        let url = "http://147.78.66.203:3210/locations"
        let headers: HTTPHeaders = ["accept": "application/json", "Authorization": "Bearer \(LocalStorage.shared.token.orEmpty)"]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseDecodable(of: [LocationModel].self) { response in
                print(response.result)
                switch response.result {
                case .success(let location):
                    completion(.success(location))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func sendAuthenticationRequest(login: String, password: String, isRegistering: Bool, completion: @escaping (Result<TokenResponse, Error>) -> Void) {
        let baseURL = "http://147.78.66.203:3210/auth/"
        let endpoint = isRegistering ? "login" : "register"
        let url = baseURL + endpoint

        let parameters: [String: String] = ["login": login, "password": password]
        let headers: HTTPHeaders = ["accept": "application/json", "Content-Type": "application/json"]

        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseDecodable(of: TokenResponse.self) { response in
                switch response.result {
                case .success(let tokenResponse):
                    completion(.success(tokenResponse))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

}
