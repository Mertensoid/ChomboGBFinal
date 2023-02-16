//
//  RegistrationBuilder.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

class RegistrationBuilder {
    static func createRegistrationScreen() -> UIViewController {
        let view = RegistrationViewController()
        let presenter = RegistrationPresenter(delegate: view)
        view.presenter = presenter
        return view
    }
}
