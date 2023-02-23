//
//  SettingsPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

class SettingsPresenter {
    
    // MARK: - Properties
    
    weak var delegate: SettingsViewInputDelegate?
    
    // MARK: - Private Properies
    
    private var networkService = MockNetworkService()
    
}

extension SettingsPresenter: SettingsViewOutputDelegate {
    func getCurrentData() {
        
    }
    
    func choosePhoto() {
        delegate?.setNewAvatar(picture: UIImage(named: "magister_284x284px") ?? UIImage())
    }
    
    func saveNewData() {
        if let delegate = delegate as? SettingsViewController {
            delegate.navigationController?.popViewController(animated: true)
        }
    }
    
    func closeSettingsScreen() {
        if let delegate = delegate as? SettingsViewController {
            delegate.navigationController?.popViewController(animated: true)
        }
    }
}
