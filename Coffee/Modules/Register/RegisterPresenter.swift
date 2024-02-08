//
//  RegisterPresenter.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 03.02.2024.
//

import Foundation

final class RegisterPresenter: RegisterPresenterProtocol {
    weak var view: RegisterViewProtocol?
    var interactor: RegisterInteractorProtocol
    var router: RegisterRouterProtocol
    
    init(interactor: RegisterInteractorProtocol, router: RegisterRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func didTapLogin() {
        router.navigationToLogin()
    }
    
    func openNearbyCoffee() {
        router.navigationToNearbyCoffee()
    }
    
    func didFail(with error: String) {
        view?.displayError(error)
    }
    
    func performRegistrationRequest(withUserData userData: (login: String, password: String, confirmPassword: String)) {
        let validationResult = validateUserInput(password: userData.password, confirmPassword: userData.confirmPassword)
        
        if validationResult {
            interactor.registerUserRequest(withData: (userData.login, userData.password))
        }
    }

    func validateUserInput(password: String, confirmPassword: String) -> Bool {
        guard password == confirmPassword else {
            didFail(with: Consts.UIConsts.passwordsNotMatchError)
            return false
        }
        
        guard isPasswordValid(password) else {
            didFail(with: Consts.UIConsts.passwordRequirementsMessage)
            return false
        }
        
        return true
    }

    private func isPasswordValid(_ password: String) -> Bool {
        let uppercaseLetterRegex = ".*[A-Z]+.*"
        let numberRegex = ".*[0-9]+.*"
        let englishAlphabetRegex = ".*[a-zA-Z]+.*"
        
        return (password.range(of: uppercaseLetterRegex, options: .regularExpression) != nil) &&
               (password.range(of: numberRegex, options: .regularExpression) != nil) &&
               (password.range(of: englishAlphabetRegex, options: .regularExpression) != nil)
    }
}
