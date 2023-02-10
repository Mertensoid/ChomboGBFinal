//
//  CatalogBuilder.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import Foundation

class CatalogBuilder {
    static func createCatalogScreen() -> UIViewController {
        let view = CatalogViewController()
        let presenter = CatalogPresenter(delegate: view)
        view.presenter = presenter
        return view
    }
}

