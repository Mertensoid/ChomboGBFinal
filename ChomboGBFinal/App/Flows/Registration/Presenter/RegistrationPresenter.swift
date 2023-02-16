//
//  RegistrationPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import Foundation

class RegistrationPresenter {
    
    // MARK: - Properties
    
    weak private var delegate: RegistrationViewInputDelegate?
    
    init(delegate: RegistrationViewInputDelegate) {
        self.delegate = delegate
    }
}

extension RegistrationPresenter: RegistrationViewOutputDelegate {
    
}
