//
//  CatalogPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

class CatalogPresenter {
    
    // MARK: - Properties
    
    weak var delegate: CatalogViewInputDelegate?
    
    // MARK: - Private properties
    
    private var catalog: [Tool] = [] {
        didSet {
            delegate?.tableViewReloadData()
        }
    }
    
    private let firestoreService = CloudFirestore()
    private let firebaseStorage = FirebaseStorage()
    
    // MARK: - Construction
    
    init() {
        
        
        //catalog = Tool.catalog
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
        return firebaseStorage.fetchImage(toolID: catalog[toolIndex].id)//UIImage()//catalog[toolIndex].picture
    }
    
    func getToolOwner(toolIndex: Int) -> String {
        return catalog[toolIndex].owner.displayName ?? ""
    }
    func showNewToolScreen() {
        let newToolVC = NewToolBuilder.createNewToolScreen()
        if let delegate = delegate as? CatalogViewController {
            delegate.navigationController?.pushViewController(newToolVC, animated: true)
        }
    }
    func showDetailsScreen() {
        let toolDetailsVC = ToolDetailsBuilder.createToolDetailsScreen()
        if let delegate = delegate as? CatalogViewController {
            delegate.navigationController?.pushViewController(toolDetailsVC, animated: true)
        }
    }
    func logout() {
        UserDefaults.standard.set(false, forKey: "status")
        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
        if let delegate = delegate as? CatalogViewController {
            delegate.dismiss(animated: true)
        }
    }
    func fetchData() {
        catalog = firestoreService.tools
    }
}
