//
//  NewToolPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit
import Foundation

class NewToolPresenter {

    // MARK: - Properties
    
    weak var delegate: NewToolViewInputDelegate?
    
    // MARK: - Private properties
    
    private let firestoreService = CloudFirestore()
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return dateFormatter
    }()
}

extension NewToolPresenter: NewToolViewOutputDelegate {
    func showCamera() {
        let cameraVC = CamViewController(cameraService: CameraService())
        cameraVC.delegate = self
        if let delegate = delegate as? NewToolViewController {
            delegate.navigationController?.pushViewController(cameraVC, animated: true)
        }
    }
    
    
    func setCategory(row: Int) {
        switch row {
        case 0:
            delegate?.showCategory(category: Category.handTools)
        case 1:
            delegate?.showCategory(category: Category.electroTools)
        case 2:
            delegate?.showCategory(category: Category.gasolineTools)
        default:
            delegate?.showCategory(category: Category.miscellaneous)
        }
    }
    
    func setDate() {
        let now = dateFormatter.string(from: Date())
        delegate?.showDate(date: now)
    }
    
    func setCondition(row: Int) {
        switch row {
        case 0:
            delegate?.showCondition(condition: .new)
        case 1:
            delegate?.showCondition(condition: .working)
        case 2:
            delegate?.showCondition(condition: .outdated)
        case 3:
            delegate?.showCondition(condition: .incomplete)
        default:
            delegate?.showCondition(condition: .broken)
        }
    }
    
    func setStatus(row: Int) {
        switch row {
        case 0:
            delegate?.showStatus(status: .inService)
        case 1:
            delegate?.showStatus(status: .free)
        case 2:
            delegate?.showStatus(status: .inProgress)
        case 3:
            delegate?.showStatus(status: .inUse)
        default:
            delegate?.showStatus(status: .broken)
        }
    }
    
    func saveNewTool() {
        
        let mockUser = User(uid: "1234", email: "test@test.com", displayName: "test user", phoneNumber: "+79991112233", photoUrl: nil)
        
        let tool = Tool(category: delegate?.getCategory() ?? .miscellaneous, brand: delegate?.getBrand() ?? "", model: delegate?.getModel() ?? "", serial: delegate?.getSerial(), productionDate: Date(), status: delegate?.getStatus() ?? .free, owner: mockUser, condition: delegate?.getCondition() ?? .new)
        
        firestoreService.dataToSaveWithModel(tool)
    }
    
    func closeNewToolScreen() {
        if let delegate = delegate as? NewToolViewController {
            delegate.navigationController?.popViewController(animated: true)
        }
    }
}

extension NewToolPresenter: PhotoDelegate {
    func setPhoto(image: UIImage) {
        delegate?.showPhoto(image: image)
    }
}
