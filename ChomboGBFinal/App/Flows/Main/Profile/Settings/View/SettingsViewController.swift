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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension SettingsViewController: SettingsViewInputDelegate {
    
}
