//
//  RegisterInteractor.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 03.02.2024.
//

import Foundation

final class RegisterInteractor: RegisterInteractorProtocol {
    weak var presenter: RegisterPresenterProtocol?
    private let api = ApiService()
    
    func registerUserRequest(withData userData: (login: String, password: String)) {
        api.sendAuthenticationRequest(login: userData.login, password: userData.password, isRegistering: false) { [weak self] result in
            switch result {
            case .success(let tokenResponse):
                LocalStorage.shared.token = tokenResponse.token
                self?.presenter?.openNearbyCoffee()
            case .failure(let error):
                self?.presenter?.didFail(with: error.localizedDescription)
            }
        }
    }
}
