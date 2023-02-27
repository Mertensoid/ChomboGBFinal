//
//  ToolDetailsPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import Foundation

class ToolDetailsPresenter {
    
    // MARK: - Properties
    
    weak var delegate: ToolDetailsViewInputDelegate?
}

extension ToolDetailsPresenter: ToolDetailsViewOutputDelegate {
    func showMapScreen() {
        let mapViewController = MapViewController()
        if let delegate = delegate as? ToolDetailsViewController {
            delegate.navigationController?.pushViewController(mapViewController, animated: true)
        }
    }
    
    func closeDetailsScreen() {
        if let delegate = delegate as? ToolDetailsViewController {
            delegate.navigationController?.popViewController(animated: true)
        }
    }
}
