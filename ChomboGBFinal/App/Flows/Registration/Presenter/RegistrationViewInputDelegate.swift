//
//  RegistrationViewInputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 16.02.2023.
//

import Foundation

protocol RegistrationViewInputDelegate: AnyObject {
    func getLogin() -> String
    func getEmail() -> String
    func getPassword() -> String
}
