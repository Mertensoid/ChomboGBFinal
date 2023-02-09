//
//  ToolsListBuilder.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

class ToolsListBuilder {
    static func createToolsListScreen() -> UIViewController {
        let view = ToolsListViewController()
        let presenter = ToolsListPresenter(delegate: view)
        view.presenter = presenter
        return view
    }
}
