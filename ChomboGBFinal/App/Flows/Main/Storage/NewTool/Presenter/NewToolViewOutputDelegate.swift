//
//  NewToolViewOutputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 31.01.2023.
//

import Foundation

protocol NewToolViewOutputDelegate: AnyObject {
    
    init(delegate: NewToolViewInputDelegate)
    
    func saveNewTool()
    func setCategory(row: Int)
    func setDate()
    func setCondition(row: Int)
}
