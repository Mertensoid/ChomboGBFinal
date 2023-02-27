//
//  TransactionsViewOutputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 27.02.2023.
//

import Foundation

protocol TransactionsViewOutputDelegate: AnyObject {
    func getTransactionsQuantity() -> Int
    func getToolName() -> String
    func getOwner() -> String
    func showDetails()
    func logout()
}
