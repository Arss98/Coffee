//
//  CustomPaymentCell.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 06.02.2024.
//

import UIKit
import SnapKit

final class CustomPaymentCell: UITableViewCell {
    let addButton = UIButton(type: .system)
    let reduceButton = UIButton(type: .system)
    weak var delegate: PaymentViewProtocol?
    var count = 0 {
        didSet {
            if count <= 0 {
                count = 0
            }
            countLabel.text = "\(count)"
        }
    }
    
    private let background = UIView()
    private let coffeeName = UILabel()
    private let price = UILabel()
    private let countLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(name: String, price: String, count: Int) {
        self.coffeeName.text = name
        self.price.text = price
        self.count = count
    }
}

private extension CustomPaymentCell {
    func initialize() {
        addSubview()
        setupUI()
        setConstraints()
    }
    
    func addSubview() {
        self.contentView.addSubview(background)
        
        [addButton, reduceButton, coffeeName, price, countLabel]
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
        
        coffeeName.font = .systemFont(ofSize: 18, weight: .bold)
        coffeeName.textColor = .main
        coffeeName.textAlignment = .left
        
        price.font = .systemFont(ofSize: 16, weight: .medium)
        price.textColor = .accentText
        price.textAlignment = .left
        
        countLabel.font = .systemFont(ofSize: 16, weight: .bold)
        countLabel.textAlignment = .center
        countLabel.textColor = .main
        
        reduceButton.setImage(.minusIcon, for: .normal)
        reduceButton.tintColor = .main
        reduceButton.addTarget(self, action: #selector(reduceButtonTapped), for: .touchUpInside)
        
        addButton.setImage(.plusIcon, for: .normal)
        addButton.tintColor = .main
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    func setConstraints() {
        background.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.trailing.equalToSuperview().inset(13)
            make.bottom.equalToSuperview().inset(4)
            make.height.equalTo(81)
            make.width.equalTo(391)
        }
        
        coffeeName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(14)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        price.snp.makeConstraints { make in
            make.top.equalTo(coffeeName.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(9)
        }
        
        addButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
            make.height.width.equalTo(24)
        }
        
        countLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(addButton.snp.leading)
            make.height.width.equalTo(24)
        }
        
        reduceButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(countLabel.snp.leading)
            make.height.width.equalTo(24)
        }
    }
    
    @objc func addButtonTapped() {
        delegate?.didTapAddButton(in: self)
    }
    
    @objc func reduceButtonTapped() {
        delegate?.didTapReduceButton(in: self)
    }
}

