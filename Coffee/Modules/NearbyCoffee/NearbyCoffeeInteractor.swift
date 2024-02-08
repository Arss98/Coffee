//
//  NearbyCoffeeInteractor.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 04.02.2024.
//

import UIKit

final class NearbyCoffeeInteractor: NearbyCoffeeInteractorProtocol {
    weak var presenter: NearbyCoffeePresenterProtocol?
    private(set) var locations: [LocationModel] = []
    private(set) var distance: [String] = []
    private let api = ApiService()
    private let locationManager = LocationManager()
    
    func fetchCoffeeShopLocation() {
        api.fetchCoffeeShopLocation { [weak self] result in
            switch result {
            case .success(let locations):
                self?.locations = locations
                var distances: [String] = []
                for location in locations {
                    if let distance = self?.locationManager.distanceToLocation(latitude: Double(location.point.latitude) ?? 0.0, longitude: Double(location.point.longitude) ?? 0.0) {
                        distances.append(String(distance))
                    } else {
                        distances.append("Не удалось вычислить расстояние")
                    }
                }
                self?.distance = distances
                self?.presenter?.didFetch()
            case .failure(let error):
                self?.presenter?.didFail(with: error.localizedDescription)
            }
        }
    }
}
