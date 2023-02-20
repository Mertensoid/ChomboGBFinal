//
//  NewToolViewOutputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 31.01.2023.
//

import Foundation

protocol NewToolViewOutputDelegate: AnyObject {
    
    init(view: NewToolViewInputDelegate)
    
    func saveNewTool()
    func setCategory(row: Int)
    func setDate()
    func setCondition(row: Int)
    func setStatus(row: Int)
}
