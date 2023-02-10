//
//  CatalogPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

class CatalogPresenter {
    
    // MARK: - Private properties
    
    private weak var delegate: CatalogViewInputDelegate?
    private var catalog: [Tool] = [] {
        didSet {
            delegate?.tableViewReloadData()
        }
    }
    
    // MARK: - Construction
    
    init(delegate: CatalogViewInputDelegate) {
        self.delegate = delegate
        catalog = Tool.catalog
    }
}

extension CatalogPresenter: CatalogViewOutputDelegate {
    
    func getToolsQuantity() -> Int {
        return catalog.count
    }
    
    func getToolName(toolIndex: Int) -> String {
        return catalog[toolIndex].brand + " " + catalog[toolIndex].model
    }
    
    func getToolCategory(toolIndex: Int) -> String {
        return catalog[toolIndex].category.rawValue
    }
    
    func getToolSerial(toolIndex: Int) -> String {
        return catalog[toolIndex].serial ?? ""
    }
    
    func getIndicatorColor(toolIndex: Int) -> UIColor {
        if catalog[toolIndex].status == .broken || catalog[toolIndex].condition == .broken {
            return ColorConstants.buttonRed
        } else if catalog[toolIndex].status == .free && (catalog[toolIndex].condition == .new || catalog[toolIndex].condition == .working) {
            return ColorConstants.buttonGreen
        } else {
            return ColorConstants.lightYellow
        }
    }
    
    func getToolImage(toolIndex: Int) -> UIImage {
        return catalog[toolIndex].picture
    }
    
    func getToolOwner(toolIndex: Int) -> String {
        return catalog[toolIndex].owner.displayName ?? ""
    }
}
