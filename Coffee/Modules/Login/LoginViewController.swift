//
//  ViewController.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 02.02.2024.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    var presenter: LoginPresenterProtocol?
    
    private let loginButton = CustomFilledButton(title: Consts.UIConsts.loginButtonTitle)
    private let registrationScreenButton = CustomButton(title: Consts.UIConsts.registerButtonTitle)
    private let emailTextField = CustomTextField(
        title: Consts.UIConsts.emailTextFieldTitle,
        placeholder: Consts.UIConsts.emailTextFieldPlaceholder)
    private let passwordTextField = CustomTextField(
        title: Consts.UIConsts.passwordTextFieldTitle,
        placeholder: Consts.UIConsts.passwordTextFieldPlaceholder,
        isSecure: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboardGesture()
        initialize()
    }
}

// MARK: - LoginViewProtocol
extension LoginViewController: LoginViewProtocol {
    func displayError(_ message: String) {
        errorAlert(message: message)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField.textField:
            passwordTextField.textField.becomeFirstResponder()
        case passwordTextField.textField:
            textField.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
}

private extension LoginViewController {
    func initialize() {
        emailTextField.textField.delegate = self
        passwordTextField.textField.delegate = self
        
        addSubviews()
        setupUI()
        setupConstraints()
    }
    
    func addSubviews() {
        [emailTextField, passwordTextField, loginButton, registrationScreenButton]
            .forEach { view.addSubview($0) }
    }
    
    func setupUI() {
        view.backgroundColor = .white
        self.title = Consts.UIConsts.loginViewTitle
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.main,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        
        loginButton.button.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
        registrationScreenButton.button.addTarget(self, action: #selector(registrationScreenButtonTap), for: .touchUpInside)
    }
    
    func setupConstraints() {
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(view.bounds.height / 4)
            make.height.equalTo(emailTextField.frame.height).priority(.low)
            make.leading.trailing.equalToSuperview().inset(18)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(24)
            make.height.equalTo(emailTextField.frame.height).priority(.low)
            make.leading.trailing.equalToSuperview().inset(18)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(18)
        }
        
        registrationScreenButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
    }
    
    @objc func loginButtonTap() {
        guard let email = emailTextField.textField.text, !email.isEmpty else {
            displayError(Consts.UIConsts.emptyFieldsErrorMessage)
            return
        }
        
        guard let password = passwordTextField.textField.text, !password.isEmpty else {
            displayError(Consts.UIConsts.emptyFieldsErrorMessage)
            return
        }
        
        presenter?.performLoginRequest(withUserData: (email, password))
    }
    
    @objc func registrationScreenButtonTap() {
        presenter?.didTapRegister()
    }
}

#Preview {
    let vc = LoginViewController()
    return vc
}
