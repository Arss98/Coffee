//
//  LoginProtocol.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 02.02.2024.
//

import Foundation

protocol LoginViewProtocol: AnyObject {
    func displayError(_ message: String)
}

protocol LoginPresenterProtocol: AnyObject {
    func didTapRegister()
    func openNearbyCoffee()
    func didFail(with error: String)
    func performLoginRequest(withUserData userData: (login: String, password: String))
}

protocol LoginInteractorProtocol: AnyObject {
    func performLoginRequest(withData userData: (login: String, password: String))
}

protocol LoginRouterProtocol: AnyObject {
    func navigationToRegistration()
    func navigationToNearbyCoffee()
}
