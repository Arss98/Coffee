//
//  NearbyCoffeeProtocol.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 04.02.2024.
//

import Foundation

protocol NearbyCoffeeViewProtocol: AnyObject {
    func reloadNearbyCoffeeList()
    func dispalyError(_ message: String) 
}

protocol NearbyCoffeePresenterProtocol: AnyObject {
    func didFail(with error: String)
    func didFetch()
    func numberOfLocation() -> Int
    func location(for indexPath: IndexPath) -> (name: String, id: String, distance: String)?
    func fetchLocations()
    func navigationToMap()
    func navigationToMenu(coffeeShopID: String)
}

protocol NearbyCoffeeInteractorProtocol: AnyObject {
    var locations: [LocationModel] { get }
    var distance: [String] { get }
    func fetchCoffeeShopLocation()
}

protocol NearbyCoffeeRouterProtocol: AnyObject {
    func navigationToMap()
    func navigationToMenu(coffeeShopID: String)
}
