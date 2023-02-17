//
//  SettingsViewController.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Properties
    
    var presenter: SettingsViewOutputDelegate?
    
    // MARK: - Private properties
    
    private let headerView: SettingsHeaderView = {
        let headerView = SettingsHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        headerView.activateConstraints()
        return headerView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension SettingsViewController: SettingsViewInputDelegate {
    
}
