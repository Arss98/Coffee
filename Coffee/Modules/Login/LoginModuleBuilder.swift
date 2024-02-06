//
//  LoginModuleBuilder.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 02.02.2024.
//

import UIKit

final class LoginModuleBuilder {
    static func build() -> UIViewController {
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(interactor: interactor, router: router)
        let viewController = LoginViewController()
        
        viewController.presenter = presenter
        presenter.view = viewController
        router.view = viewController
        interactor.presenter = presenter

        return viewController
    }
}
