//
//  LoginRouter.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 02.02.2024.
//

import UIKit

final class LoginRouter: LoginRouterProtocol {
    weak var view: LoginViewController?
    
    func navigationToRegistration() {
        let registrationViewController = RegisterModuleBuilder.build()
        
        view?.navigationController?.setViewControllers([registrationViewController], animated: true)
    }
    
    func navigationToNearbyCoffee() {
        let nearbyCoffeeVC = NearbyCoffeeModuleBuilder.build()
        
        view?.navigationController?.pushViewController(nearbyCoffeeVC, animated: true)
    }
}
