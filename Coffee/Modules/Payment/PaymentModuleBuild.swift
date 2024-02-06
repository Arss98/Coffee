//
//  PaymentModuleBuild.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 06.02.2024.
//

import UIKit

final class PaymentModuleBuild {
    static func build(coffeeCount: [Int: Int], coffeeItems: [CoffeeModel]) -> UIViewController {
        let interactor = PaymentInteractor(coffeeCount: coffeeCount, coffeeItems: coffeeItems)
        let router = PaymentRouter()
        let presenter = PaymentPresenter(interactor: interactor, router: router)
        let viewController = PaymentViewController()
        
        viewController.presenter = presenter
        presenter.view = viewController
        router.view = viewController
        interactor.presenter = presenter
    
        return viewController
    }
}
