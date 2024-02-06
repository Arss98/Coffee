//
//  RegisterModuleBuilder.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 03.02.2024.
//

import UIKit

final class RegisterModuleBuilder {
    static func build() -> UIViewController {
        let interactor = RegisterInteractor()
        let router = RegisterRouter()
        let presenter = RegisterPresenter(interactor: interactor, router: router)
        let viewController = RegisterViewController()
        
        viewController.presenter = presenter
        presenter.view = viewController
        router.view = viewController
        interactor.presenter = presenter

        return viewController
    }
}
