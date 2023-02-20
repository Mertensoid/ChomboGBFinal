//
//  Status.swift
//  ChomboGBFinal
//
//  Created by admin on 09.02.2023.
//

import Foundation

enum Status: String, Codable {
    case free = "Free"
    case inProgress = "Transaction"
    case inUse = "In use"
    case inService = "Service"
    case broken = "Broken"
}
