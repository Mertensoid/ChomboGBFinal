//
//  CatalogPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import Foundation

class CatalogPresenter {
    
    // MARK: - Private properties
    
    private weak var delegate: CatalogViewInputDelegate?
    
    init(delegate: CatalogViewInputDelegate) {
        self.delegate = delegate
    }
}

extension CatalogPresenter: CatalogViewOutputDelegate {
    
}
