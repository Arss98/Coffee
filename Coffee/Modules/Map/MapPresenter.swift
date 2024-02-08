//
//  MapPresenter.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import Foundation

final class MapPresenter: MapPresenterProtocol {
    weak var view: MapViewProtocol?
    var interactor: MapInteractorProtocol
    var router: MapRouterProtocol
    
    init(interactor: MapInteractorProtocol, router: MapRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func didFail(with error: String) {
        view?.dispalyError(error)
    }
    
    func didFetch() {
        view?.updateMapPlacemarket()
    }
    
    func fetchLocations() {
        interactor.fetchCoffeeShopLocation()
    }
    
    func locations() -> [LocationModel]? {
        return interactor.locations
    }
    
    func navigationToMenu(coffeeShopID: String) {
        router.navigationToMenu(coffeeShopID: coffeeShopID)
    }
}
