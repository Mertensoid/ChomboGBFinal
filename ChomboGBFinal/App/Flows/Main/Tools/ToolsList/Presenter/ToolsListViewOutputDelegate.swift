//
//  ToolsListViewOutputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 09.02.2023.
//

import UIKit

protocol ToolsListViewOutputDelegate: AnyObject {
    func getToolsQuantity() -> Int
    func getToolName(toolIndex: Int) -> String
    func getToolCategory(toolIndex: Int) -> String
    func getToolSerial(toolIndex: Int) -> String
    func getToolCondition(toolIndex: Int) -> String
//    func getToolImage(toolIndex: Int) -> UIImage
}
