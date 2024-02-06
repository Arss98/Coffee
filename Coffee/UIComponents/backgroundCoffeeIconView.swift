//
//  backgroundCoffeeIconView.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import UIKit
import YandexMapsMobile
import SnapKit

final class backgroundCoffeeIconView: UIView {
    private let icon = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 58, height: 58))
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension backgroundCoffeeIconView {
    func initialize() {
        self.addSubview(icon)
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        self.backgroundColor = .button
        self.layer.cornerRadius = self.frame.height / 2
        
        icon.frame = bounds
        icon.image = .coffeeIcon
        icon.contentMode = .scaleAspectFit
    }
    
    func setupConstraints() {
        icon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

final class CustomViewProvider: YRTViewProvider {
    private let view: UIView

    init(view: UIView) {
        self.view = view
        super.init()
    }

    func views() -> UIView {
        return view
    }
}
