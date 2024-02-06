//
//  CustomTextField.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 03.02.2024.
//

import UIKit
import SnapKit

final class CustomTextField: UIView {
    let textField = UITextField()
    private let titleLabel = UILabel()
    private let placeholderText: String
    
    init(title: String, placeholder: String, isSecure: Bool = false) {
        self.titleLabel.text = title
        self.textField.isSecureTextEntry = isSecure
        self.placeholderText = placeholder
        super.init(frame: CGRect(x: 0, y: 0, width: .zero, height: 72))
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CustomTextField {
    func initialize() {
        addSubview(titleLabel)
        addSubview(textField)
        
        setupConstraints()
        setupUI()
    }
    
    func setupConstraints() {
        textField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(48)
            make.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(textField.snp.top).offset(-6)
            make.leading.equalToSuperview()
        }
    }
    
    func setupUI() {
        textField.borderStyle = .line
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.main.cgColor
        textField.layer.cornerRadius = 24
        textField.layer.masksToBounds = true
        textField.textColor = .main
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: .zero))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: .zero))
        textField.leftViewMode = .always
        textField.rightViewMode = .always
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.accentText,
            .font: UIFont.systemFont(ofSize: 18, weight: .regular)
        ]
        
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: attributes
        )
        
        titleLabel.textColor = .main
        titleLabel.font = .systemFont(ofSize: 15, weight: .regular)
    }
}
