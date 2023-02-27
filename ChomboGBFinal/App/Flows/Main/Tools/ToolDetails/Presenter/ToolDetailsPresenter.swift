//
//  ToolDetailsPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import Foundation

class ToolDetailsPresenter {
    
    // MARK: - Properties
    
    weak var delegate: ToolDetailsViewInputDelegate?
    
    var currentTool: Tool?
    
    // MARK: - Private properties
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return dateFormatter
    }()
}

extension ToolDetailsPresenter: ToolDetailsViewOutputDelegate {
    func showMapScreen() {
        let mapViewController = MapViewController()
        if let delegate = delegate as? ToolDetailsViewController {
            delegate.navigationController?.pushViewController(mapViewController, animated: true)
        }
    }
    
    func closeDetailsScreen() {
        if let delegate = delegate as? ToolDetailsViewController {
            delegate.navigationController?.popViewController(animated: true)
        }
    }
    
    func showCurrentData() {
        delegate?.showCategory(data: currentTool?.category.rawValue ?? "")
        delegate?.showBrand(data: currentTool?.brand ?? "")
        delegate?.showModel(data: currentTool?.model ?? "")
        delegate?.showSerial(data: currentTool?.serial ?? "")
        delegate?.showProductionDate(data: dateFormatter.string(from: currentTool?.productionDate ?? Date()))
        delegate?.showStatus(data: currentTool?.status.rawValue ?? "")
        delegate?.showOwner(data: currentTool?.owner.displayName ?? "")
        delegate?.showTransferDate(data: dateFormatter.string(from: currentTool?.productionDate ?? Date()))
        delegate?.showCondition(data: currentTool?.condition.rawValue ?? "")
    }
}
