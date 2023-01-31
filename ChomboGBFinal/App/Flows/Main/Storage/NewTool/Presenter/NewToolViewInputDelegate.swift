//
//  NewToolViewInputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 31.01.2023.
//

import Foundation

protocol NewToolViewInputDelegate: AnyObject {
    func setupInitialState()
    func setupData(with mockData: ([MockTool]))
    func displayData(index: Int)
}
