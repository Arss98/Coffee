//
//  NearbyCoffeeProtocol.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 04.02.2024.
//

import Foundation

protocol NearbyCoffeeViewProtocol: AnyObject {
    var presenter: NearbyCoffeePresenterProtocol? { get set }
    func reloadNearbyCoffeeList()
    func dispalyError(_ message: String) 
    func replaceRootViewControllerWithLogin()
}

protocol NearbyCoffeePresenterProtocol: AnyObject {
    var view: NearbyCoffeeViewProtocol? { get set }
    var interactor: NearbyCoffeeInteractorProtocol { get set }
    var router: NearbyCoffeeRouterProtocol { get set }
    func didFail(with error: String)
    func didFetch()
    func numberOfLocation() -> Int
    func location(for indexPath: IndexPath) -> (name: String, id: String, distance: String)?
    func fetchLocations()
    func navigationToMap()
    func navigationToMenu(coffeeShopID: String)
    func performUnauthorizedAccessFlow()
}

protocol NearbyCoffeeInteractorProtocol: AnyObject {
    var presenter: NearbyCoffeePresenterProtocol? { get set }
    var locations: [LocationModel] { get }
    var distance: [String] { get }
    func fetchCoffeeShopLocation()
}

protocol NearbyCoffeeRouterProtocol: AnyObject {
    var view: NearbyCoffeeViewController? { get set }
    func navigationToMap()
    func navigationToMenu(coffeeShopID: String)
    func replaceRootViewControllerWithLogin()
}
