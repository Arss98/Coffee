//
//  MenuInteractor.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import Foundation

final class MenuInteractor: MenuInteractorProtocol {
    weak var presenter: MenuPresenterProtocol?
    var id: String
    private(set) var coffee: [CoffeeModel] = []
    private let api = ApiService()
    
    init(id: String) {
        self.id = id
    }
    
    func fetchCoffee() {
        api.fetchCoffee(coffeeShopID: self.id) { result in
            switch result {
            case .success(let coffee):
                self.coffee = coffee
                self.presenter?.didFetch()
            case .failure(let error):
                self.presenter?.didFail(with: error.localizedDescription)
            }
        }
    }
}
