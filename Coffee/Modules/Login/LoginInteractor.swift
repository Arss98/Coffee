//
//  LoginInteractor.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 02.02.2024.
//

import Foundation

final class LoginInteractor: LoginInteractorProtocol {
    weak var presenter: LoginPresenterProtocol? 
    private let api = ApiService()
    
    func performLoginRequest(withData userData: (login: String, password: String)) {
        api.sendAuthenticationRequest(login: userData.login, password: userData.password, isRegistering: true) { result in
            switch result {
            case .success(let tokenResponse):
                LocalStorage.shared.token = tokenResponse.token
                LocalStorage.shared.isAuthorization = true
                self.presenter?.openNearbyCoffee()
            case .failure(let error):
                self.presenter?.didFail(with: error.localizedDescription)
            }
        }
    }
}
