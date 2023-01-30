//
//  TabBarConstants.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import Foundation

enum Tabs: Int {
    case profile
    case tools
    case storage
    case transactions
}

enum TabBarLabels: String {
    case profile = "Profile"
    case tools = "Tools"
    case storage = "Storage"
    case transactions = "Transactions"
}

enum TabBarIcons {
    static let profile = "person.circle"
    static let tools = "hammer.circle"
    static let storage = "tray.circle"
    static let transactions = "doc.circle"
}
