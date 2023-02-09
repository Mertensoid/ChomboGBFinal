//
//  ToolsListPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import Foundation
import UIKit

class ToolsListPresenter {
    
    // MARK: - Private properties
    
    weak private var delegate: ToolsListViewInputDelegate?
    
    private var userTools: [Tool] = [] {
        didSet {
            delegate?.tableViewReloadData()
        }
    }
    // MARK: - Construction
    
    required init(delegate: ToolsListViewInputDelegate?) {
        self.delegate = delegate
    }
}

extension ToolsListPresenter: ToolsListViewOutputDelegate {
    func getToolsQuantity() -> Int {
        return userTools.count
    }
    
    func getToolName(toolIndex: Int) -> String {
        return userTools[toolIndex].brand + " " + userTools[toolIndex].model
    }
    
    func getToolCategory(toolIndex: Int) -> String {
        return userTools[toolIndex].category.rawValue
    }
    
    func getToolSerial(toolIndex: Int) -> String {
        return userTools[toolIndex].serial ?? ""
    }
    
    func getToolCondition(toolIndex: Int) -> String {
        return userTools[toolIndex].condition.rawValue
    }
    
    func getToolImage(toolIndex: Int) -> UIImage {
        return userTools[toolIndex].picture
    }
}
