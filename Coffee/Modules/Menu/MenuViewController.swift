//
//  MenuViewController.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {
    var presenter: MenuPresenterProtocol?
    private let paymentButton = CustomFilledButton(title: Consts.UIConsts.toPaymentViewButtonTitle)
    private let coffeeCollection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        presenter?.fetchCoffee()
    }
}

// MARK: - MenuViewProtocol
extension MenuViewController: MenuViewProtocol {
    func displayError(_ message: String) {
        errorAlert(message: message)
    }
    
    func reloadCoffeeCollection() {
        coffeeCollection.reloadData()
    }
    
    func didTapReduceButton(in cell: CustomCollectionCell) {
        cell.count -= 1
        if let id = cell.id {
            presenter?.decreaseCoffeeCount(forId: id)
        }
    }
    
    func didTapAddButton(in cell: CustomCollectionCell) {
        cell.count += 1
        if let id = cell.id {
            presenter?.increaseCoffeeCount(forId: id)
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfCoffee() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Consts.UIConsts.collectionCellIdentifier,
            for: indexPath) as! CustomCollectionCell
        cell.delegate = self
        
        let coffee = presenter?.coffee(for: indexPath)
        if let coffee {
            cell.configure(id: coffee.id, name: coffee.name, price: coffee.price, imageURL: coffee.imageURL)
        }
        
        return cell
    }
}

// MARK: - Private methods
private extension MenuViewController {
    func initialize() {
        addSubview()
        setupConstraints()
        setupDefaultNavigationBar(title: Consts.UIConsts.menuViewTitle)
        configureCollectionView()
    }
    
    func configureCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 13, bottom: 14, right: 13)
        flowLayout.minimumLineSpacing = 14
        flowLayout.minimumInteritemSpacing = 14
        flowLayout.scrollDirection = .vertical
        flowLayout.estimatedItemSize = CGSize(width: 165, height: 205)
        
        coffeeCollection.backgroundColor = .white
        coffeeCollection.collectionViewLayout = flowLayout
        coffeeCollection.register(CustomCollectionCell.self,
                                  forCellWithReuseIdentifier: Consts.UIConsts.collectionCellIdentifier)
        
        coffeeCollection.delegate = self
        coffeeCollection.dataSource = self
        
        paymentButton.button.addTarget(self, action: #selector(paymentButtonTap), for: .touchUpInside)
    }
    
    func addSubview() {
        [paymentButton, coffeeCollection]
            .forEach{ view.addSubview($0) }
    }
    
    func setupConstraints() {
        paymentButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(18)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        coffeeCollection.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(paymentButton.snp.top)
        }
    }
    
    @objc func paymentButtonTap() {
        presenter?.navigationToPayment()
    }
}

#Preview {
    let vc = MenuViewController()
    return vc
}
