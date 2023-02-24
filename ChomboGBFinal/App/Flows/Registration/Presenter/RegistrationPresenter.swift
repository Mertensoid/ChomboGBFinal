//
//  RegistrationPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit
import FirebaseAuth

class RegistrationPresenter {
    
    // MARK: - Properties
    
    weak var delegate: RegistrationViewInputDelegate?
    
    // MARK: - Private properties
    
    private var networkService = MockNetworkService()
    private let firebaseAuthService = FirebaseAuth()
}

extension RegistrationPresenter: RegistrationViewOutputDelegate {
    func closeRegistrationScreen() {
        if let delegate = delegate as? RegistrationViewController {
            delegate.dismiss(animated: true)
        }
    }
    
//    func registration() {
//        let result = networkService.registration(login: delegate?.getLogin() ?? "", email: delegate?.getEmail() ?? "", password: delegate?.getPassword() ?? "")
//        if result == 1 {
//            if let delegate = delegate as? RegistrationViewController {
//                delegate.dismiss(animated: true)
//            }
//        } else {
//            print("Ошибка регистрации")
//            print("Показываем предупреждение")
//        }
//    }
    
    func registration() {
        firebaseAuthService.signUpWithEmail(email: delegate?.getEmail() ?? "", password: delegate?.getPassword() ?? "") { (verifiedEmail, status) in
            
            if !verifiedEmail {
                let message = status // нужно добавить алерт и этот месадж в его текст поместить
                print(message)
                
                let alertVC = UIAlertController(title: "Ошибка", message: "\(message)", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alertVC.addAction(action)
                if let delegate = self.delegate as? RegistrationViewController {
                    delegate.present(alertVC, animated: true)
                }
            } else {
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                let currentUser = Auth.auth().currentUser
                print(currentUser ?? "")
                let mainTabBar = MainTabBarController()
                mainTabBar.modalPresentationStyle = .fullScreen
                if let delegate = self.delegate as? RegistrationViewController {
                    delegate.present(mainTabBar, animated: true)
                }
            }
        }
    }
    
    
}
