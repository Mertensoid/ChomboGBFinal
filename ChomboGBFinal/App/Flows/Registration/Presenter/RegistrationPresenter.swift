//
//  RegistrationPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import Foundation

class RegistrationPresenter {
    
    // MARK: - Properties
    
    weak var delegate: RegistrationViewInputDelegate?
    
    // MARK: - Private properties
    
    private var networkService = MockNetworkService()
}

extension RegistrationPresenter: RegistrationViewOutputDelegate {
    func closeRegistrationScreen() {
        if let delegate = delegate as? RegistrationViewController {
            delegate.dismiss(animated: true)
        }
    }
    
    func registration() {
        let result = networkService.registration(login: delegate?.getLogin() ?? "", email: delegate?.getEmail() ?? "", password: delegate?.getPassword() ?? "")
        if result == 1 {
            if let delegate = delegate as? RegistrationViewController {
                delegate.dismiss(animated: true)
            }
        } else {
            print("Ошибка регистрации")
            print("Показываем предупреждение")
        }
    }
}
