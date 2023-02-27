//
//  CatalogViewOutputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 10.02.2023.
//

import UIKit

protocol CatalogViewOutputDelegate: AnyObject {
    func getToolsQuantity() -> Int
    func getToolName(toolIndex: Int) -> String
    func getToolCategory(toolIndex: Int) -> String
    func getToolSerial(toolIndex: Int) -> String
    func getIndicatorColor(toolIndex: Int) -> UIColor
    func getToolImage(toolIndex: Int) -> UIImage
    func getToolOwner(toolIndex: Int) -> String
    func showNewToolScreen()
    func showDetailsScreen()
    func logout()
    func fetchData()
}
