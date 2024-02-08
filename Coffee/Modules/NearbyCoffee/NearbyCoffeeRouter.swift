//
//  NearbyCoffeeRouter.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 04.02.2024.
//

import UIKit

final class NearbyCoffeeRouter: NearbyCoffeeRouterProtocol {
    weak var view: NearbyCoffeeViewController?

    func navigationToMap() {
        let mapVC = MapModuleBuilder.build()
        
        view?.navigationController?.pushViewController(mapVC, animated: true)
    }
    
    func navigationToMenu(coffeeShopID: String) {
        let menuVC = MenuModuleBuilder.build(id: coffeeShopID)
        
        view?.navigationController?.pushViewController(menuVC, animated: true)
    }
    
    func replaceRootViewControllerWithLogin() {
        let loginVC = LoginModuleBuilder.build()
        
        view?.navigationController?.setViewControllers([loginVC], animated: true)
    }
}
