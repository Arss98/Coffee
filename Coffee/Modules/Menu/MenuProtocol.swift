//
//  MenuProtocol.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import UIKit

protocol MenuViewProtocol: AnyObject {
    func didTapAddButton(in cell: CustomCollectionCell)
    func didTapReduceButton(in cell: CustomCollectionCell)
    func displayError(_ message: String)
    func reloadCoffeeCollection()
}

protocol MenuPresenterProtocol: AnyObject {
    var coffeeItems: [Int: Int] { get set }
    func didFail(with error: String)
    func didFetch()
    func numberOfCoffee() -> Int
    func navigationToPayment()
    func coffee(for indexPath: IndexPath) -> CoffeeModel?
    func fetchCoffee()
    func increaseCoffeeCount(forId id: Int)
    func decreaseCoffeeCount(forId id: Int)
}

protocol MenuInteractorProtocol: AnyObject {
    var id: String { get set }
    var coffee: [CoffeeModel] { get }
    func fetchCoffee()
}

protocol MenuRouterProtocol: AnyObject {
    func navigationToPayment(coffeeCount: [Int: Int], coffeeItems: [CoffeeModel])
}
