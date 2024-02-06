//
//  PaymentViewController.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 06.02.2024.
//

import UIKit
import SnapKit

final class PaymentViewController: UIViewController {
    var presenter: PaymentPresenterProtocol?
    private let paymentButton = CustomFilledButton(title: Consts.UIConsts.paymentButtonTitle)
    private let coffeeList = UITableView()
    private let waitingTimeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - PaymentViewProtocol
extension PaymentViewController: PaymentViewProtocol {
    func didTapAddButton(in cell: CustomPaymentCell) {
        cell.count += 1
        
        print(cell.count)
    }
    
    func didTapReduceButton(in cell: CustomPaymentCell) {
        cell.count -= 1
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension PaymentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfCoffeeData() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = Consts.UIConsts.paymentCellIdentifier
        coffeeList.register(CustomPaymentCell.self, forCellReuseIdentifier: identifier)
        
        let cell = coffeeList.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CustomPaymentCell
        cell.delegate = self
        if let coffeeData = presenter?.getCoffeeData(for: indexPath) {
            cell.configure(name: coffeeData.name, price: String(coffeeData.price), count: coffeeData.count)
        }
        
        return cell
    }
}

// MARK: - Private methods
private extension PaymentViewController {
    func initialize() {
        coffeeList.delegate = self
        coffeeList.dataSource = self
        
        setupDefaultNavigationBar(title: Consts.UIConsts.paymnetViewTitle)
        addSubview()
        setupConstraints()
        setupUI()
    }
    
    func addSubview() {
        [paymentButton, coffeeList, waitingTimeLabel]
            .forEach { view.addSubview($0) }
    }
    
    func setupConstraints() {
        paymentButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(18)
        }
        
        waitingTimeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(13)
            make.bottom.equalTo(paymentButton.snp.top).inset(-160)
            make.height.equalTo(90)
        }
        
        coffeeList.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(waitingTimeLabel.snp.top)
        }
    }
    
    func setupUI() {
        waitingTimeLabel.text = Consts.UIConsts.waitingTimeLabelTitle
        waitingTimeLabel.font = .systemFont(ofSize: 24, weight: .medium)
        waitingTimeLabel.textColor = .main
        waitingTimeLabel.numberOfLines = 0
        waitingTimeLabel.textAlignment = .center
        
        coffeeList.backgroundColor = .white
        coffeeList.separatorStyle = .none
        coffeeList.allowsSelection = false
        paymentButton.button.addTarget(self, action: #selector(paymentButtonTap), for: .touchUpInside)
    }
    
    @objc func paymentButtonTap() {
        let alert = UIAlertController(title: Consts.UIConsts.successPaymentTitle,
                                      message: Consts.UIConsts.successPaymentMessage,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: Consts.UIConsts.alertOkButtonTitle, style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}

#Preview {
    let vc = PaymentViewController()
    return vc
}
