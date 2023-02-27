//
//  ToolDetailsViewInputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 03.02.2023.
//

import Foundation

protocol ToolDetailsViewInputDelegate: AnyObject {
    func showCategory(data: String)
    func showBrand(data: String)
    func showModel(data: String)
    func showSerial(data: String)
    func showProductionDate(data: String)
    
    func showStatus(data: String)
    func showOwner(data: String)
    func showTransferDate(data: String)
    
    func showCondition(data: String)
}
