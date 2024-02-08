//
//  ViewController+Extension.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 04.02.2024.
//

import UIKit

extension UIViewController {
    func arrorAlertNoAutorization(message: String, action: @escaping () -> Void) {
        let alert = UIAlertController(title: Consts.UIConsts.errorAlertTitle, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Consts.UIConsts.alertOkButtonTitle, style: .default) { _ in
            action()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func errorAlert(message: String) {
        let alert = UIAlertController(title: Consts.UIConsts.errorAlertTitle, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Consts.UIConsts.alertOkButtonTitle, style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func setupDefaultNavigationBar(title: String) {
        self.title = title
        view.backgroundColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.main,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        
        if let backButtonImage = UIImage(named: "arrowBack") {
            let resizedBackButtonImage = backButtonImage.withRenderingMode(.alwaysOriginal)
            let backButton = UIBarButtonItem(image: resizedBackButtonImage, style: .plain, target: self, action: #selector(backAction))
            navigationItem.leftBarButtonItem = backButton
            navigationItem.hidesBackButton = true
        }
    }
    
    func dismissKeyboardGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
}
