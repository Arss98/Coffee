//
//  MenuProtocol.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import UIKit

protocol MenuViewProtocol: AnyObject {
    var presenter: MenuPresenterProtocol? { get set }
    func didTapAddButton(in cell: CustomCollectionCell)
    func didTapReduceButton(in cell: CustomCollectionCell)
    func displayError(_ message: String)
    func reloadCoffeeCollection()
}

protocol MenuPresenterProtocol: AnyObject {
    var view: MenuViewProtocol? { get set}
    var interactor: MenuInteractorProtocol { get set }
    var router: MenuRouterProtocol { get set }
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
    var presenter: MenuPresenterProtocol? { get set }
    var id: String { get set }
    var coffee: [CoffeeModel] { get }
    func fetchCoffee()
}

protocol MenuRouterProtocol: AnyObject {
    var view: MenuViewController? { get set }
    func navigationToPayment(coffeeCount: [Int: Int], coffeeItems: [CoffeeModel])
}
