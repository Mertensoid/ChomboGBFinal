//
//  ProfileViewOutputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 16.02.2023.
//

import Foundation

protocol ProfileViewOutputDelegate: AnyObject {
    func logout()
    func updateUserInformation()
    func showEditProfileScreen()
}
