//
//  LoginPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 24.01.2023.
//

import Foundation

class LoginPresenter {
    
    // MARK: - Properties
    
    weak var delegate: LoginViewInputDelegate?
    
    // MARK: - Private properties
    
    private let networkService = MockNetworkService()
}

extension LoginPresenter: LoginViewOutputDelegate {
    
    func checkAccountData() {
        print("Account checking")
        
        if let currentUser = networkService.auth(login: delegate?.getLogin() ?? "", password: delegate?.getPassword() ?? "") {
            delegate?.clearLoginTextField()
            delegate?.clearPasswordTextField()
            UserSingleton.shared.user = currentUser
            let mainTabBar = MainTabBarController()
            mainTabBar.modalPresentationStyle = .fullScreen
            if let delegate = delegate as? LoginViewController {
                delegate.present(mainTabBar, animated: true)
            }
        } else {
            print("Ошибка авторизации")
            print("Показываем предупреждение о неправильных данных")
        }
    }
    
    func showRegistrationScreen() {
        delegate?.clearLoginTextField()
        delegate?.clearPasswordTextField()
        let registrationVC = RegistrationBuilder.createRegistrationScreen()
        registrationVC.modalPresentationStyle = .fullScreen
        if let delegate = delegate as? LoginViewController {
            delegate.present(registrationVC, animated: true)
        }
    }
}
