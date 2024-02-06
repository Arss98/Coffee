//
//  CustomCollectionCell.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import UIKit
import SnapKit
import SDWebImage

final class CustomCollectionCell: UICollectionViewCell {
    let addButton = UIButton(type: .system)
    let reduceButton = UIButton(type: .system)
    weak var delegate: MenuViewProtocol?
    var count = 0 {
        didSet {
            if count <= 0 {
                count = 0
            }
            countLabel.text = "\(count)"
        }
    }
    
    private(set) var id: Int?
    private let image = UIImageView()
    private let name = UILabel()
    private let price = UILabel()
    private let countLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(id: Int, name: String, price: Double, imageURL: String) {
        self.id = id
        self.name.text = name
        self.price.text = String(price)
        if let url = URL(string: imageURL) {
            self.image.sd_setImage(with: url, completed: nil)
        }
    }
}

// MARK: - private methods
private extension CustomCollectionCell {
    func initialize() {
        addSubview()
        setupConstraint()
        setupUI()
    }
    
    func addSubview() {
        [image, name, price, countLabel, addButton, reduceButton]
            .forEach { self.addSubview($0) }
    }
    
    func setupConstraint() {
        self.snp.makeConstraints { make in
            make.height.equalTo(205)
            make.width.equalTo(175)
        }
        
        image.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(self.frame.height * (2 / 3))
        }
        
        name.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(18)
        }
        
        price.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview().inset(10)
            make.width.equalTo(66)
            make.height.equalTo(26)
        }
        
        reduceButton.snp.makeConstraints { make in
            make.leading.equalTo(price.snp.trailing).offset(4)
            make.bottom.equalToSuperview().inset(10)
        }
        
        countLabel.snp.makeConstraints { make in
            make.leading.equalTo(reduceButton.snp.trailing).offset(6)
            make.bottom.equalToSuperview().inset(10)
            make.height.equalTo(26)
            make.width.equalTo(18)
        }
        
        addButton.snp.makeConstraints { make in
            make.leading.equalTo(countLabel.snp.trailing).offset(6)
            make.trailing.equalToSuperview().inset(6)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0.4
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 3.5
        
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 5
        image.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        image.layer.masksToBounds = true
        
        name.font = .systemFont(ofSize: 15, weight: .medium)
        name.textAlignment = .left
        name.textColor = .accentText
        
        price.font = .systemFont(ofSize: 14, weight: .bold)
        price.textAlignment = .left
        price.textColor = .main
        
        countLabel.font = .systemFont(ofSize: 14, weight: .regular)
        countLabel.textAlignment = .center
        countLabel.text = String(count)
        countLabel.textColor = .main
        
        reduceButton.setImage(.minusIcon, for: .normal)
        reduceButton.tintColor = .accent
        reduceButton.addTarget(self, action: #selector(reduceButtonTapped), for: .touchUpInside)
        
        addButton.setImage(.plusIcon, for: .normal)
        addButton.tintColor = .accent
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc func addButtonTapped() {
        delegate?.didTapAddButton(in: self)
    }
    
    @objc func reduceButtonTapped() {
        delegate?.didTapReduceButton(in: self)
    }
}
