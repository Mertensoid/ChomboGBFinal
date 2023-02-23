//
//  LoginViewInputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 03.02.2023.
//

import Foundation

protocol LoginViewInputDelegate: AnyObject {
    func showLogin(login: String)
    func getLogin() -> String
    func getPassword() -> String
    func clearLoginTextField()
    func clearPasswordTextField()
    
}
