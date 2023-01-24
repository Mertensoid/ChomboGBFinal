//
//  LoginViewController.swift
//  ChomboGBFinal
//
//  Created by admin on 24.01.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    private let joinButton = UIButton()
    private let registrationButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        layoutViews()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
}

extension LoginViewController {
    
    func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(loginTextField)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(joinButton)
        scrollView.addSubview(registrationButton)
    }
    
    func layoutViews() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            loginTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            loginTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -20),
            loginTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            loginTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: -20),
            passwordTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            joinButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            joinButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            joinButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            joinButton.heightAnchor.constraint(equalToConstant: 50),
            
            registrationButton.topAnchor.constraint(equalTo: joinButton.bottomAnchor, constant: 20),
            registrationButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            registrationButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            registrationButton.bottomAnchor.constraint(lessThanOrEqualTo: scrollView.bottomAnchor, constant: -10),
            registrationButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func configure() {
        
        view.backgroundColor = ColorConstants.baseWhite
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.placeholder = "E-mail"
        loginTextField.backgroundColor = ColorConstants.backgroundGray
        loginTextField.borderStyle = .roundedRect

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = ColorConstants.backgroundGray
        passwordTextField.borderStyle = .roundedRect

        joinButton.translatesAutoresizingMaskIntoConstraints = false
        joinButton.setTitle("Join", for: .normal)
        joinButton.addTarget(self, action: #selector(joinButtonPressed), for: .touchUpInside)
        joinButton.backgroundColor = ColorConstants.darkYellow
        joinButton.layer.cornerRadius = 25
        joinButton.setOpacity()
        joinButton.makeTapWithButtonShadow()

        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.setTitle("Registration", for: .normal)
        registrationButton.addTarget(self, action: #selector(registrationButtonPressed), for: .touchUpInside)
        registrationButton.backgroundColor = ColorConstants.darkYellow
        registrationButton.layer.cornerRadius = 25
        registrationButton.setOpacity()
        registrationButton.makeTapWithButtonShadow()
    }
}

@objc extension LoginViewController {
    
    // Когда клавиатура появляется
    func keyboardWasShown(notification: Notification) {

        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .required
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .defaultHigh
            self.view.layoutIfNeeded()
        }
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }

    //Когда клавиатура исчезает
    func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .defaultHigh
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .required
            self.view.layoutIfNeeded()
        }
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    func joinButtonPressed() {
        
    }
    
    func registrationButtonPressed() {
        
    }
}
