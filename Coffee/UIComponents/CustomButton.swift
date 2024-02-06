//
//  CustomButton.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 03.02.2024.
//

import UIKit
import SnapKit

final class CustomButton: UIView {
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

private extension CustomButton {
    func initialize() {
        self.addSubview(button)
        setupConstraints()
        setupUI()
    }
    
    func setupConstraints() {
        button.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func setupUI() {
        button.tintColor = .main
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
    }
}
