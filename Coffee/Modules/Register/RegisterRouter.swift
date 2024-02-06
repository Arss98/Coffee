//
//  RegisterRouter.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 03.02.2024.
//

import UIKit

final class RegisterRouter: RegisterRouterProtocol {
    weak var view: RegisterViewController?
    
    func navigationToLogin() {
        let loginViewController = LoginModuleBuilder.build()
        
        view?.navigationController?.setViewControllers([loginViewController], animated: true)
    }
    
    func navigationToNearbyCoffee() {
        let nearbyCoffeeVC = NearbyCoffeeModuleBuilder.build()
        
        view?.navigationController?.pushViewController(nearbyCoffeeVC, animated: true)
    }
}
