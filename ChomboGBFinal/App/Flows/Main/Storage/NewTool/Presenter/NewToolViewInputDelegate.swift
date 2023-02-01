//
//  NewToolViewInputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 31.01.2023.
//

import UIKit
import Foundation

protocol NewToolViewInputDelegate: AnyObject {

    func getCategory() -> MockCategory
    func getBrand() -> String
    func getModel() -> String
    func getSerial() -> String
    func getCondition() -> MockCondition
    func showCategory(category: MockCategory)
    func showDate(date: String)
    func showCondition(condition: MockCondition)
}
