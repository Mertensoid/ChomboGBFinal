//
//  ToolDetailsPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import Foundation

class ToolDetailsPresenter {
    
    // MARK: - Private properties
    
    weak private var delegate: ToolDetailsViewInputDelegate?
    
    // MARK: - Construction
    
    required init(delegate: ToolDetailsViewInputDelegate?) {
        self.delegate = delegate
    }
}

extension ToolDetailsPresenter: ToolDetailsViewOutputDelegate {
    
}
