//
//  LoginPresenter.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 02.02.2024.
//

import Foundation

final class LoginPresenter: LoginPresenterProtocol {    
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol
    var router: LoginRouterProtocol
    
    init(interactor: LoginInteractorProtocol, router: LoginRouterProtocol) { 
        self.interactor = interactor
        self.router = router
    }
    
    func didTapRegister() {
        router.navigationToRegistration()
    }
    
    func openNearbyCoffee() {
        router.navigationToNearbyCoffee()
    }
    
    func didFail(with error: String) {
        view?.displayError(error)
    }
    
    func performLoginRequest(withUserData userData: (login: String, password: String)) {
        interactor.performLoginRequest(withData: userData)
    }
}
