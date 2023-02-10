//
//  NewToolPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit
import Foundation

class NewToolPresenter: NewToolViewOutputDelegate {
    
    

    // MARK: - Private properties
    
    private weak var delegate: NewToolViewInputDelegate?
    private let firestoreService = CloudFirestore()
    
    // MARK: - Construction
    
    required init(delegate: NewToolViewInputDelegate) {
        self.delegate = delegate
    }
    
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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
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
//        let mockTool = MockTool(
//            id: 123,
//            category: view?.getCategory() ?? MockCategory.miscellaneous,
//            brand: view?.getBrand() ?? "",
//            model: view?.getModel() ?? "",
//            serial: view?.getSerial() ?? "",
//            productionDate: Date(),
//            status: MockStatus.free,
//            owner: MockUser(userID: 1, userName: "Vasya Pupkin", accountType: .admin),
//            condition: view?.getCondition() ?? MockCondition.broken,
//            location: MockLocation(
//                latitude: 31.0005434,
//                longitude: 65.4643721),
//            picture: UIImage(systemName: "hammer") ?? UIImage())
//        print(mockTool.productionDate)
        firestoreService.dataToSave(delegate?.getBrand() ?? "", delegate?.getModel() ?? "", delegate?.getSerial() ?? "")
    }
}
