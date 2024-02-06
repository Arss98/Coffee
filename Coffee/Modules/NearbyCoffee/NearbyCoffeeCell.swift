//
//  NearbyCoffeeCell.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import UIKit
import SnapKit

class NearbyCoffeeCell: UITableViewCell {
    private let background = UIView()
    private let coffeeShopName = UILabel()
    private let distanceToCoffeeShop = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, distance: String) {
        coffeeShopName.text = title
        distanceToCoffeeShop.text = distance
    }
}

private extension NearbyCoffeeCell {
    func initialize() {
        addSubview()
        setupUI()
        setConstraints()
    }
    
    func addSubview() {
        self.addSubview(background)
        
        [coffeeShopName, distanceToCoffeeShop]
            .forEach { background.addSubview($0) }
    }
    
    func setupUI() {
        self.backgroundColor = .white
        
        background.backgroundColor = .accent
        background.layer.cornerRadius = 5
        background.layer.borderWidth = 0.4
        background.layer.borderColor = UIColor.clear.cgColor
        
        background.layer.shadowColor = UIColor.black.cgColor
        background.layer.shadowOffset = CGSize(width: 0, height: 3)
        background.layer.shadowOpacity = 0.2
        background.layer.shadowRadius = 3.5
        
        coffeeShopName.font = .systemFont(ofSize: 18, weight: .bold)
        coffeeShopName.textColor = .main
        coffeeShopName.textAlignment = .left
        
        distanceToCoffeeShop.font = .systemFont(ofSize: 14, weight: .regular)
        distanceToCoffeeShop.textColor = .accentText
        distanceToCoffeeShop.textAlignment = .left
    }
    
    func setConstraints() {
        background.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.trailing.equalToSuperview().inset(13)
            make.bottom.equalToSuperview().inset(4)
        }
        
        coffeeShopName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(14)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        distanceToCoffeeShop.snp.makeConstraints { make in
            make.top.equalTo(coffeeShopName.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(9)
        }
    }
}
