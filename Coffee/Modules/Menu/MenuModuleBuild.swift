//
//  MenuModuleBuild.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import UIKit

final class MenuModuleBuilder {
    static func build(id: String) -> UIViewController {
        let interactor = MenuInteractor(id: id)
        let router = MenuRouter()
        let presenter = MenuPresenter(interactor: interactor, router: router)
        let viewController = MenuViewController()
        
        viewController.presenter = presenter
        presenter.view = viewController
        router.view = viewController
        interactor.presenter = presenter

        return viewController
    }
}
