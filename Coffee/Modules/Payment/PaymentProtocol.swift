//
//  PaymentProtocol.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 06.02.2024.
//

import Foundation

protocol PaymentViewProtocol: AnyObject {
    var presenter: PaymentPresenterProtocol? { get set}
    func didTapAddButton(in cell: CustomPaymentCell)
    func didTapReduceButton(in cell: CustomPaymentCell)
}

protocol PaymentInteractorProtocol: AnyObject {
    var presenter: PaymentPresenterProtocol? { get set}
    var coffeeCount: [Int: Int] { get set }
    var coffeeItems: [CoffeeModel] { get set }
    func getCombinedCoffeeData() -> [(name: String, price: Double, count: Int)]
}

protocol PaymentPresenterProtocol: AnyObject {
    var view: PaymentViewProtocol? { get set }
    var interactor: PaymentInteractorProtocol { get set }
    var router: PaymentRouterProtocol { get set }
    func getCoffeeData(for indexPath: IndexPath) -> (name: String, price: Double, count: Int)
    func numberOfCoffeeData() -> Int
}

protocol PaymentRouterProtocol: AnyObject {
    var view: PaymentViewController? { get set }
}
