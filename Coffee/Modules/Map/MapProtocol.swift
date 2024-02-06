//
//  MapProtocol.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import Foundation

protocol MapViewProtocol: AnyObject {
    func dispalyError(_ message: String) 
    func updateMapPlacemarket()
}

protocol MapPresenterProtocol: AnyObject {
    func didFail(with error: String)
    func didFetch()
    func fetchLocations()
    func locations() -> [LocationModel]?
    func navigationToMenu(coffeeShopID: String)

}

protocol MapInteractorProtocol: AnyObject {
    var locations: [LocationModel] { get }
    func fetchCoffeeShopLocation()
}

protocol MapRouterProtocol: AnyObject {
    func navigationToMenu(coffeeShopID: String)
}
