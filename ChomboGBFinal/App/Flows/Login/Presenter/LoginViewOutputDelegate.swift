//
//  LoginViewOutputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 03.02.2023.
//

import Foundation

protocol LoginViewOutputDelegate: AnyObject {
    func checkAccountData()
    func showRegistrationScreen()
    func goToMainTabBar()
}
