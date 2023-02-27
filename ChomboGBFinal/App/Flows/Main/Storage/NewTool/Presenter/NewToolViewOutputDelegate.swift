//
//  NewToolViewOutputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 31.01.2023.
//

import UIKit

protocol NewToolViewOutputDelegate: AnyObject {
    
    func saveNewTool()
    func setCategory(row: Int)
    func setDate()
    func setCondition(row: Int)
    func showCamera()
    func closeNewToolScreen()
    func setStatus(row: Int)
    func setPhoto(image: UIImage)
}
