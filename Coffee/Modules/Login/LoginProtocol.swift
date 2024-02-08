//
//  LoginProtocol.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 02.02.2024.
//

import Foundation

protocol LoginViewProtocol: AnyObject {
    var presenter: LoginPresenterProtocol? { get set }
    func displayError(_ message: String)
}

protocol LoginPresenterProtocol: AnyObject {
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorProtocol { get set }
    var router: LoginRouterProtocol { get set }
    func didTapRegister()
    func openNearbyCoffee()
    func didFail(with error: String)
    func performLoginRequest(withUserData userData: (login: String, password: String))
}

protocol LoginInteractorProtocol: AnyObject {
    var presenter: LoginPresenterProtocol? { get set }
    func performLoginRequest(withData userData: (login: String, password: String))
}

protocol LoginRouterProtocol: AnyObject {
    var view: LoginViewController? { get set }
    func navigationToRegistration()
    func navigationToNearbyCoffee()
}
