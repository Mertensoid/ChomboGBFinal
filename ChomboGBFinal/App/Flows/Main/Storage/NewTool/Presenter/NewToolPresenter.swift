//
//  NewToolPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit
import Foundation

class NewToolPresenter: NewToolViewOutputDelegate {

    // MARK: - Properties
    
    weak var delegate: NewToolViewInputDelegate?
    
    // MARK: - Private properties
    
    private let firestoreService = CloudFirestore()
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return dateFormatter
    }()
    
    // MARK: - Public functions
    
    func setCategory(row: Int) {
        switch row {
        case 0:
            delegate?.showCategory(category: MockCategory.handTools)
        case 1:
            delegate?.showCategory(category: MockCategory.electroTools)
        case 2:
            delegate?.showCategory(category: MockCategory.gasolineTools)
        default:
            delegate?.showCategory(category: MockCategory.miscellaneous)
        }
    }
    
    func setDate() {
        let now = dateFormatter.string(from: Date())
        delegate?.showDate(date: now)
    }
    
    func setCondition(row: Int) {
        switch row {
        case 0:
            delegate?.showCondition(condition: .excellent)
        case 1:
            delegate?.showCondition(condition: .good)
        case 2:
            delegate?.showCondition(condition: .normal)
        default:
            delegate?.showCondition(condition: .broken)
        }
    }
    
    func saveNewTool() {
        firestoreService.dataToSave(delegate?.getBrand() ?? "", delegate?.getModel() ?? "", delegate?.getSerial() ?? "")
    }
}
