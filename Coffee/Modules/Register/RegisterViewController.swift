//
//  RegisterViewController.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 03.02.2024.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    var presenter: RegisterPresenterProtocol?
    
    private let registerButton = CustomFilledButton(title: Consts.UIConsts.registerButtonTitle)
    private let loginScreenButton = CustomButton(title: Consts.UIConsts.loginButtonTitle)
    private let emailTextField = CustomTextField(
        title: Consts.UIConsts.emailTextFieldTitle,
        placeholder: Consts.UIConsts.emailTextFieldPlaceholder)
    private let passwordTextField = CustomTextField(
        title: Consts.UIConsts.passwordTextFieldTitle,
        placeholder: Consts.UIConsts.passwordTextFieldPlaceholder,
        isSecure: true)
    private let confirmPasswordTextField = CustomTextField(
        title: Consts.UIConsts.confirmPasswordTextFieldTitle,
        placeholder: Consts.UIConsts.confirmPasswordTextFieldPlaceholder,
        isSecure: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboardGesture()
        initialize()
    }
}

// MARK: - RegisterViewProtocol
extension RegisterViewController: RegisterViewProtocol {
    func displayError(_ message: String) {
        errorAlert(message: message)
    }
}

// MARK: - UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField.textField:
            passwordTextField.textField.becomeFirstResponder()
        case passwordTextField.textField:
            confirmPasswordTextField.textField.becomeFirstResponder()
        case confirmPasswordTextField.textField:
            textField.resignFirstResponder()
        default:
            break
        }

        return true
    }
}

// MARK: - Private metods
private extension RegisterViewController {
    func initialize() {
        emailTextField.textField.delegate = self
        passwordTextField.textField.delegate = self
        confirmPasswordTextField.textField.delegate = self
        
        addSubviews()
        setupUI()
        setupConstraints()
    }
    
    func addSubviews() {
        [emailTextField, passwordTextField, confirmPasswordTextField, registerButton, loginScreenButton]
            .forEach { view.addSubview($0) }
    }
    
    func setupUI() {
        view.backgroundColor = .white
        self.title = Consts.UIConsts.registerViewTitle
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.main,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        
        loginScreenButton.button.addTarget(self, action: #selector(loginScreenButtonTap), for: .touchUpInside)
        registerButton.button.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside)
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
        
        confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(24)
            make.height.equalTo(emailTextField.frame.height).priority(.low)
            make.leading.trailing.equalToSuperview().inset(18)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(18)
        }
        
        loginScreenButton.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
    }
    
    @objc func registerButtonTap() {
        guard let email = emailTextField.textField.text, !email.isEmpty else {
            displayError(Consts.UIConsts.emptyFieldsErrorMessage)
            return
        }
        
        guard let password = passwordTextField.textField.text, !password.isEmpty else {
            displayError(Consts.UIConsts.emptyFieldsErrorMessage)
            return
        }
        
        guard let confirmPassword = confirmPasswordTextField.textField.text, !confirmPassword.isEmpty else {
            displayError(Consts.UIConsts.emptyFieldsErrorMessage)
            return
        }

        presenter?.performRegistrationRequest(withUserData: (email, password, confirmPassword))
    }

    
    @objc func loginScreenButtonTap() {
        presenter?.didTapLogin()
    }
}

#Preview {
    let vc = RegisterViewController()
    return vc
}
