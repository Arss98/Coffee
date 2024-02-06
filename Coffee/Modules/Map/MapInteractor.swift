//
//  MapInteractor.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import Foundation

final class MapInteractor: MapInteractorProtocol {
    weak var presenter: MapPresenterProtocol?
    var locations: [LocationModel] = []
    private let api = ApiService()
    
    func fetchCoffeeShopLocation() {
        api.fetchCoffeeShopLocation { [weak self] result in
            switch result {
            case .success(let locations):
                self?.locations = locations
                self?.presenter?.didFetch()
            case .failure(let error):
                self?.presenter?.didFail(with: error.localizedDescription)
            }
        }
    }
}
