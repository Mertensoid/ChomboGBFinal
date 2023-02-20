//
//  NewToolViewInputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 31.01.2023.
//

import UIKit
import Foundation

protocol NewToolViewInputDelegate: AnyObject {

    func getCategory() -> Category
    func getBrand() -> String
    func getModel() -> String
    func getSerial() -> String
    func getCondition() -> Condition
    func getStatus() -> Status
    func showCategory(category: Category)
    func showDate(date: String)
    func showCondition(condition: Condition)
    func showStatus(status: Status)
}
