//
//  ToolDetailsBuilder.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

class ToolDetailsBuilder {
    
    static func createToolDetailsScreen(tool: Tool) -> ToolDetailsViewController {
        
        let view = ToolDetailsViewController()
        let presenter = ToolDetailsPresenter()
        presenter.currentTool = tool
        presenter.delegate = view
        view.presenter = presenter
        return view
    }
}
