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
}

extension LoginPresenter: LoginViewOutputDelegate {
    
    func checkAccountData() {
        print("Account checking")
        delegate?.clearLoginTextField()
        delegate?.clearPasswordTextField()
        let mainTabBar = MainTabBarController()
        mainTabBar.modalPresentationStyle = .fullScreen
        if let delegate = delegate as? LoginViewController {
            delegate.present(mainTabBar, animated: true)
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
