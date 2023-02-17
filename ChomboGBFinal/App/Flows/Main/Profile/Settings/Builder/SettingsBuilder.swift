//
//  SettingsBuilder.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

class SettingsBuilder {
    static func createSettingsScreen() -> UIViewController {
        let view = SettingsViewController()
        let presenter = SettingsPresenter()
        presenter.delegate = view
        view.presenter = presenter
        return view
    }
}
