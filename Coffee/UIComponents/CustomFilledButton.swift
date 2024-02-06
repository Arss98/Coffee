//
//  CustomButton.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 03.02.2024.
//

import UIKit
import SnapKit

final class CustomFilledButton: UIView {
    var button = UIButton(type: .system)
    
    init(title: String) {
        self.button.setTitle(title, for: .normal)
        super.init(frame: .zero)
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CustomFilledButton {
    func initialize() {
        self.addSubview(button)
        
        setupConstraints()
        setupUI()
    }
    
    func setupConstraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        button.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func setupUI() {
        button.backgroundColor = .button
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        button.tintColor = .accent
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
    }
}
