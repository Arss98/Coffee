//
//  PaymentInteractor.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 06.02.2024.
//

import Foundation

final class PaymentInteractor: PaymentInteractorProtocol {
    weak var presenter: PaymentPresenterProtocol?
    var coffeeCount: [Int : Int]
    var coffeeItems: [CoffeeModel]
    
    init(coffeeCount: [Int : Int], coffeeItems: [CoffeeModel]) {
        self.coffeeCount = coffeeCount
        self.coffeeItems = coffeeItems
    }
    
    func getCombinedCoffeeData() -> [(name: String, price: Double, count: Int)] {
        var combinedData: [(name: String, price: Double, count: Int)] = []

        for coffee in coffeeItems {
            if let count = coffeeCount[coffee.id] {
                combinedData.append((name: coffee.name, price: coffee.price, count: count))
            }
        }

        return combinedData
    }
}
