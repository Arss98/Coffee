//
//  MenuRouter.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import UIKit

final class MenuRouter: MenuRouterProtocol {
    weak var view: MenuViewController?
    
    func navigationToPayment(coffeeCount: [Int: Int], coffeeItems: [CoffeeModel]) {
        let paymentVC = PaymentModuleBuild.build(coffeeCount: coffeeCount, coffeeItems: coffeeItems)
        
        view?.navigationController?.pushViewController(paymentVC, animated: true)
    }
}
