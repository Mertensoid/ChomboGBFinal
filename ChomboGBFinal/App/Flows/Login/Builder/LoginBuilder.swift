//
//  LoginBuilder.swift
//  ChomboGBFinal
//
//  Created by admin on 24.01.2023.
//

import Foundation

class LoginBuilder {
    static func createLoginScreen() -> LoginViewController {
        let view = LoginViewController()
        let presenter = LoginPresenter()
        presenter.delegate = view
        view.presenter = presenter
        return view
    }
}
