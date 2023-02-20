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
    
    weak private var view: NewToolViewInputDelegate?
    private let firestoreService = CloudFirestore()
    
    // MARK: - Construction
    
    required init(view: NewToolViewInputDelegate) {
        self.view = view
    }
    
    // MARK: - Public functions
    
    func setCategory(row: Int) {
        switch row {
        case 0:
            view?.showCategory(category: Category.handTools)
        case 1:
            view?.showCategory(category: Category.electroTools)
        case 2:
            view?.showCategory(category: Category.gasolineTools)
        default:
            view?.showCategory(category: Category.miscellaneous)
        }
    }
    
    func setDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let now = dateFormatter.string(from: Date())
        view?.showDate(date: now)
    }
    
    func setCondition(row: Int) {
        switch row {
        case 0:
            view?.showCondition(condition: .new)
        case 1:
            view?.showCondition(condition: .working)
        case 2:
            view?.showCondition(condition: .outdated)
        case 3:
            view?.showCondition(condition: .incomplete)
        default:
            view?.showCondition(condition: .broken)
        }
    }
    
    func setStatus(row: Int) {
        switch row {
        case 0:
            view?.showStatus(status: .inService)
        case 1:
            view?.showStatus(status: .free)
        case 2:
            view?.showStatus(status: .inProgress)
        case 3:
            view?.showStatus(status: .inUse)
        default:
            view?.showStatus(status: .broken)
        }
    }
    
    func saveNewTool() {
        
        let mockUser = User(uid: "1234", email: "test@test.com", displayName: "test user", phoneNumber: "+79991112233", photoUrl: nil)
        
        let tool = Tool(category: view?.getCategory() ?? .miscellaneous, brand: view?.getBrand() ?? "", model: view?.getModel() ?? "", serial: view?.getSerial(), productionDate: Date(), status: view?.getStatus() ?? .free, owner: mockUser, condition: view?.getCondition() ?? .new)
        
        firestoreService.dataToSaveWithModel(tool)
    }
}
