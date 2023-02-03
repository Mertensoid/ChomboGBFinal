//
//  LoginPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 24.01.2023.
//

import Foundation

class LoginPresenter {
    
    // MARK: - Private properties
    
    weak private var view: LoginViewController?
    
    // MARK: - Construction
    
    required init(view: LoginViewController) {
        self.view = view
    }
}

extension LoginPresenter: LoginViewOutputDelegate {
    
    func checkAccountData() {
        print("Account checking")
        view?.clearLoginTextField()
        view?.clearPasswordTextField()
        let mainTabBar = MainTabBarController()
        mainTabBar.modalPresentationStyle = .fullScreen
        view?.present(mainTabBar, animated: true)
    }
    
    func showRegistrationScreen() {
        view?.clearLoginTextField()
        view?.clearPasswordTextField()
        let registrationVC = RegistrationViewController()
        registrationVC.modalPresentationStyle = .fullScreen
        view?.present(registrationVC, animated: true)
    }
}
