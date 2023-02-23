//
//  ProfileBuilder.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import Foundation

class ProfileBuilder {
    static func createProfileScreen() -> ProfileViewController {
        let profileView = ProfileViewController()
        let profilePresenter = ProfilePresenter()
        profileView.presenter = profilePresenter
        profilePresenter.delegate = profileView
        return profileView
    }
}
