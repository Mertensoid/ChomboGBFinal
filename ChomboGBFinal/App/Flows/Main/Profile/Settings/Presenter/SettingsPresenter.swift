//
//  SettingsPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import Foundation

class SettingsPresenter {
    
    // MARK: - Properties
    
    weak var delegate: SettingsViewInputDelegate?
    
    // MARK: - Private properties
    
    private let headerView: NewToolHeaderView = {
        let headerView = NewToolHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        headerView.activateConstraints()
        return headerView
    }()
}

extension SettingsPresenter: SettingsViewOutputDelegate {
    
}
