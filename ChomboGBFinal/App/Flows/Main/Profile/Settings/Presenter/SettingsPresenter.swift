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
}

extension SettingsPresenter: SettingsViewOutputDelegate {
    func choosePhoto() {
        delegate?.setNewAvatar(picture: UIImage(named: "magister_284x284px") ?? UIImage())
    }
    func saveNewData() {
        
    }
}
