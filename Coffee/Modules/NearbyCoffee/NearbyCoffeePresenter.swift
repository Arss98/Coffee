//
//  NearbyCoffeePresenter.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 04.02.2024.
//

import Foundation

final class NearbyCoffeePresenter: NearbyCoffeePresenterProtocol {
    weak var view: NearbyCoffeeViewProtocol?
    let interactor: NearbyCoffeeInteractorProtocol
    let router: NearbyCoffeeRouterProtocol
    
    init(interactor: NearbyCoffeeInteractorProtocol, router: NearbyCoffeeRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func fetchLocations() {
        interactor.fetchCoffeeShopLocation()
    }
    
    func didFail(with error: String) {
        view?.dispalyError(error)
    }
    
    func didFetch() {
        view?.reloadNearbyCoffeeList()
    }
    
    func numberOfLocation() -> Int {
        return interactor.locations.count
    }
    
    func location(for indexPath: IndexPath) -> (name: String, id: String, distance: String)? {
        let name = interactor.locations[indexPath.row].name
        let id = String(interactor.locations[indexPath.row].id)
        let distance = interactor.distance[indexPath.row] + Consts.UIConsts.distanceLabel
        
        return (name, id, distance)
    }
    
    func navigationToMap() {
        router.navigationToMap()
    }
    
    func navigationToMenu(coffeeShopID: String) {
        router.navigationToMenu(coffeeShopID: coffeeShopID)
    }
}
