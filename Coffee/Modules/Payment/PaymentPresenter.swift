//
//  PaymentPresenter.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 06.02.2024.
//

import Foundation

final class PaymentPresenter: PaymentPresenterProtocol {
    weak var view: PaymentViewProtocol?
    var interactor: PaymentInteractorProtocol
    var router: PaymentRouterProtocol
    
    init(interactor: PaymentInteractorProtocol, router: PaymentRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func numberOfCoffeeData() -> Int {
        return interactor.getCombinedCoffeeData().count
    }
    
    func getCoffeeData(for indexPath: IndexPath) -> (name: String, price: Double, count: Int) {
        let coffeeItems = interactor.getCombinedCoffeeData()
        return coffeeItems[indexPath.row]
    }
}
