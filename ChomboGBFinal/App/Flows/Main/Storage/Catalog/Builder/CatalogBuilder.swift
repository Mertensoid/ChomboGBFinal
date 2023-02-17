//
//  CatalogBuilder.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

class CatalogBuilder {
    static func createCatalogScreen() -> UIViewController {
        let view = CatalogViewController()
        let presenter = CatalogPresenter()
        presenter.delegate = view
        view.presenter = presenter
        return view
    }
}

