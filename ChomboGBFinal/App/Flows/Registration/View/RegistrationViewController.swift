//
//  RegistrationViewController.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var presenter: RegistrationViewOutputDelegate?
    
    // MARK: - Private properties
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.activateConstraints()
        return scrollView
    }()
    private let nameTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.activateConstraints()
        loginTextField.placeholder = "Name"
        loginTextField.backgroundColor = ColorConstants.backgroundGray
        loginTextField.borderStyle = .roundedRect
        return loginTextField
    }()
    private let emailTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.activateConstraints()
        loginTextField.placeholder = "E-mail"
        loginTextField.backgroundColor = ColorConstants.backgroundGray
        loginTextField.borderStyle = .roundedRect
        return loginTextField
    }()
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.activateConstraints()
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = ColorConstants.backgroundGray
        passwordTextField.borderStyle = .roundedRect
        return passwordTextField
    }()
    private let checkBox: UIButton = {
        let checkBox = UIButton()
        checkBox.activateConstraints()
        checkBox.backgroundColor = ColorConstants.backgroundGray
        checkBox.layer.borderColor = ColorConstants.borderGray.cgColor
        checkBox.layer.borderWidth = 1
        checkBox.layer.cornerRadius = 4
        return checkBox
    }()
    private let checkBoxTitle: UILabel = {
        let checkBoxTitle = UILabel()
        checkBoxTitle.activateConstraints()
        checkBoxTitle.backgroundColor = ColorConstants.baseWhite
        checkBoxTitle.textColor = ColorConstants.checkBoxTitleGray
        checkBoxTitle.numberOfLines = 0
        checkBoxTitle.text = "I would like to receive your newsletters and other promotional information."
        return checkBoxTitle
    }()
    private let registrationButton: UIButton = {
        let registrationButton = UIButton()
        registrationButton.activateConstraints()
        registrationButton.setTitle("Register", for: .normal)
        registrationButton.backgroundColor = ColorConstants.darkYellow
        registrationButton.layer.cornerRadius = 25
        registrationButton.setOpacity()
        registrationButton.makeTapWithButtonShadow()
        return registrationButton
    }()
    private let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.activateConstraints()
        loginButton.setTitle("Already have account?", for: .normal)
        loginButton.setTitleColor(ColorConstants.darkYellow, for: .normal)
        loginButton.backgroundColor = ColorConstants.baseWhite
        return loginButton
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        configureConstraints()
        configureViews()
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
    
    //MARK: - Private functions
    
    private func addViews() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(nameTextField)
        scrollView.addSubview(emailTextField)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(checkBox)
        scrollView.addSubview(checkBoxTitle)
        scrollView.addSubview(registrationButton)
        scrollView.addSubview(loginButton)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 200),
            nameTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            nameTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            checkBox.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            checkBox.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            checkBox.widthAnchor.constraint(equalToConstant: 16),
            checkBox.heightAnchor.constraint(equalToConstant: 16),
            
            checkBoxTitle.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            checkBoxTitle.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 10),
            checkBoxTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            //checkBoxTitle.heightAnchor.constraint(equalToConstant: 50),
            
            registrationButton.topAnchor.constraint(equalTo: checkBoxTitle.bottomAnchor, constant: 20),
            registrationButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            registrationButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            registrationButton.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 20),
            loginButton.bottomAnchor.constraint(lessThanOrEqualTo: scrollView.bottomAnchor, constant: -10),
        ])
    }
    
    private func configureViews() {
        
        view.backgroundColor = ColorConstants.baseWhite

        registrationButton.addTarget(self, action: #selector(registrationButtonPressed), for: .touchUpInside)
        
        loginButton.addTarget(self, action: #selector(joinButtonPressed), for: .touchUpInside)
    }
}

//перенести в presenter
@objc extension RegistrationViewController {
    
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
        self.dismiss(animated: true)
    }
    
    func registrationButtonPressed() {
        self.dismiss(animated: true)
    }
}

extension RegistrationViewController: RegistrationViewInputDelegate {
    
}
