//
//  RegisterProtocol.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 03.02.2024.
//

import Foundation

protocol RegisterViewProtocol: AnyObject {
    var presenter: RegisterPresenterProtocol? { get set }
    func displayError(_ message: String)
}

protocol RegisterPresenterProtocol: AnyObject {
    var view: RegisterViewProtocol? { get set }
    var interactor: RegisterInteractorProtocol { get set }
    var router: RegisterRouterProtocol { get set }
    func didTapLogin()
    func openNearbyCoffee()
    func didFail(with error: String)
    func validateUserInput(password: String, confirmPassword: String) -> Bool
    func performRegistrationRequest(withUserData userData: (login: String, password: String, confirmPassword: String))
}

protocol RegisterInteractorProtocol: AnyObject {
    var presenter: RegisterPresenterProtocol? { get set }
    func registerUserRequest(withData userData: (login: String, password: String))
}

protocol RegisterRouterProtocol: AnyObject {
    var view: RegisterViewController? { get set }
    func navigationToLogin()
    func navigationToNearbyCoffee()
}
