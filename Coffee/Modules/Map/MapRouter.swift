//
//  MapRouter.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import UIKit

final class MapRouter: MapRouterProtocol {
    weak var view: MapViewController?
    
    func navigationToMenu(coffeeShopID: String) {
        let menuVC = MenuModuleBuilder.build(id: coffeeShopID)
        
        view?.navigationController?.pushViewController(menuVC, animated: true)
    }
}

