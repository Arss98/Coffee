//
//  MapProtocol.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import Foundation

protocol MapViewProtocol: AnyObject {
    var presenter: MapPresenterProtocol? { get set }
    func dispalyError(_ message: String)
    func updateMapPlacemarket()
}

protocol MapPresenterProtocol: AnyObject {
    var view: MapViewProtocol? { get set }
    var interactor: MapInteractorProtocol { get set }
    var router: MapRouterProtocol { get set }
    func didFail(with error: String)
    func didFetch()
    func fetchLocations()
    func locations() -> [LocationModel]?
    func navigationToMenu(coffeeShopID: String)

}

protocol MapInteractorProtocol: AnyObject {
    var presenter: MapPresenterProtocol? { get set }
    var locations: [LocationModel] { get }
    func fetchCoffeeShopLocation()
}

protocol MapRouterProtocol: AnyObject {
    var view: MapViewController? { get set }
    func navigationToMenu(coffeeShopID: String)
}
