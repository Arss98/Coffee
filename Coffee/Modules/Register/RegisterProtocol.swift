//
//  RegisterProtocol.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 03.02.2024.
//

import Foundation

protocol RegisterViewProtocol: AnyObject {
    func displayError(_ message: String)
}

protocol RegisterPresenterProtocol: AnyObject {
    func didTapLogin()
    func openNearbyCoffee()
    func didFail(with error: String)
    func validateUserInput(password: String, confirmPassword: String) -> Bool
    func performRegistrationRequest(withUserData userData: (login: String, password: String, confirmPassword: String))
}

protocol RegisterInteractorProtocol: AnyObject {
    func registerUserRequest(withData userData: (login: String, password: String))
}

protocol RegisterRouterProtocol: AnyObject {
    func navigationToLogin()
    func navigationToNearbyCoffee()
}
