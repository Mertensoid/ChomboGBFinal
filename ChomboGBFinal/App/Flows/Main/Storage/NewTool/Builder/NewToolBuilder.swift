//
//  NewToolBuilder.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

class NewToolBuilder {
    static func createNewToolScreen() -> UIViewController {
        let view = NewToolViewController()
        let presenter = NewToolPresenter()
        presenter.delegate = view
        view.presenter = presenter
        return view
    }
}
