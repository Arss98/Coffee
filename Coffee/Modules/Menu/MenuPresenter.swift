//
//  MenuPresenter.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import Foundation

final class MenuPresenter: MenuPresenterProtocol {
    weak var view: MenuViewProtocol?
    var coffeeItems: [Int: Int] = [:]
    let interactor: MenuInteractor
    let router: MenuRouter
    
    init(interactor: MenuInteractor, router: MenuRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func increaseCoffeeCount(forId id: Int) {
        if let count = coffeeItems[id] {
            coffeeItems[id] = count + 1
        } else {
            coffeeItems[id] = 1
        }
    }
    
    func decreaseCoffeeCount(forId id: Int) {
        if var count = coffeeItems[id] {
            count -= 1
            if count <= 0 {
                coffeeItems.removeValue(forKey: id)
            } else {
                coffeeItems[id] = count
            }
        }
    }
    
    func fetchCoffee() {
        interactor.fetchCoffee()
    }
    
    func didFail(with error: String) {
        view?.displayError(error)
    }
    
    func didFetch() {
        view?.reloadCoffeeCollection()
    }
    
    func numberOfCoffee() -> Int {
        return interactor.coffee.count
    }
    
    func coffee(for indexPath: IndexPath) -> CoffeeModel? {
        return interactor.coffee[indexPath.row]
    }
    
    func navigationToPayment() {
        if coffeeItems.isEmpty{
            self.view?.displayError(Consts.UIConsts.emptyCartMessage)
        } else {
            router.navigationToPayment(coffeeCount: self.coffeeItems, coffeeItems: interactor.coffee)
        }
    }
}
