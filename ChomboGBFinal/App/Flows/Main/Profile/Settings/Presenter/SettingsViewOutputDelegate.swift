//
//  SettingsViewOutputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 17.02.2023.
//

import Foundation

protocol SettingsViewOutputDelegate: AnyObject {
    func getCurrentData()
    func choosePhoto()
    func saveNewData()
    func closeSettingsScreen()
}
