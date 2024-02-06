//
//  NearbyCoffeeModuleBuilder.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 04.02.2024.
//

import UIKit

final class NearbyCoffeeModuleBuilder {
    static func build() -> UIViewController {
        let interactor = NearbyCoffeeInteractor()
        let router = NearbyCoffeeRouter()
        let presenter = NearbyCoffeePresenter(interactor: interactor, router: router)
        let viewController = NearbyCoffeeViewController()
        
        viewController.presenter = presenter
        presenter.view = viewController
        router.view = viewController
        interactor.presenter = presenter

        return viewController
    }
}
