//
//  MapPresenter.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import Foundation

final class MapPresenter: MapPresenterProtocol {
    weak var view: MapViewProtocol?
    let interactor: MapInteractor
    let router: MapRouter
    
    init(interactor: MapInteractor, router: MapRouter) {
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
