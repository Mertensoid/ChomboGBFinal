//
//  ToolDetailsPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import Foundation

class ToolDetailsPresenter {
    
    // MARK: - Private properties
    
    weak private var view: ToolDetailsViewController?
    
    // MARK: - Construction
    
    required init(view: ToolDetailsViewController?) {
        self.view = view
    }
}

extension ToolDetailsPresenter: ToolDetailsViewOutputProtocol {
    
}
