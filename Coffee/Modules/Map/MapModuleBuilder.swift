//
//  MapModuleBuilder.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import UIKit

final class MapModuleBuilder {
    static func build() -> UIViewController {
        let interactor = MapInteractor()
        let router = MapRouter()
        let presenter = MapPresenter(interactor: interactor, router: router)
        let viewController = MapViewController()
        
        viewController.presenter = presenter
        presenter.view = viewController
        router.view = viewController
        interactor.presenter = presenter

        return viewController
    }
}
