//
//  NearbyCoffeeViewController.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 04.02.2024.
//

import UIKit
import SnapKit

final class NearbyCoffeeViewController: UIViewController {
    var presenter: NearbyCoffeePresenterProtocol?
    
    private let openMapScreenButton = CustomFilledButton(title: Consts.UIConsts.openMapButtonTitle)
    private let listNearbyCoffee = UITableView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        presenter?.fetchLocations()
    }
}

// MARK: - NearbyCoffeeViewProtocol
extension NearbyCoffeeViewController: NearbyCoffeeViewProtocol {
    func reloadNearbyCoffeeList() {
        listNearbyCoffee.reloadData()
    }
    
    func dispalyError(_ message: String) {
        errorAlert(message: message)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension NearbyCoffeeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfLocation() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = Consts.UIConsts.nearbyCellIdentifier
        listNearbyCoffee.register(NearbyCoffeeCell.self, forCellReuseIdentifier: identifier)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! NearbyCoffeeCell
        let location = presenter?.location(for: indexPath)
        if let location {
            cell.configure(title: location.name, distance: location.distance)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let coffeeShopID = presenter?.location(for: indexPath)?.id {
            presenter?.navigationToMenu(coffeeShopID: coffeeShopID)
        }
    }
}

// MARK: - private methods
private extension NearbyCoffeeViewController {
    func initialize() {
        listNearbyCoffee.delegate = self
        listNearbyCoffee.dataSource = self
        
        addSubviews()
        setupUI()
        setupConstraints()
        setupDefaultNavigationBar(title: Consts.UIConsts.nearbyCoffeeViewTitle)
    }
    
    func addSubviews() {
        [openMapScreenButton, listNearbyCoffee]
            .forEach { view.addSubview($0) }
    }
    
    func setupUI() {
        self.listNearbyCoffee.backgroundColor = .white
        self.listNearbyCoffee.separatorStyle = .none
        self.openMapScreenButton.button.addTarget(self, action: #selector(navigationToMap), for: .touchUpInside)
    }
    
    func setupConstraints() {
        openMapScreenButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(18)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        listNearbyCoffee.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(openMapScreenButton.snp.top)
        }
    }
   
    @objc func navigationToMap() {
        presenter?.navigationToMap()
    }
}

#Preview {
    let vc = NearbyCoffeeViewController()
    return vc
}
