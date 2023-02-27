//
//  TransactionsPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import Foundation

class TransactionsPresenter {
    
    // MARK: - Properties
    
    weak var delegate: TransactionsViewInputDelegate?
}

extension TransactionsPresenter: TransactionsViewOutputDelegate {
    func getToolName() -> String {
        return ""
    }
    
    func getOwner() -> String {
        return ""
    }
    
    func getTransactionsQuantity() -> Int {
        return 0
    }
    
    func showDetails() {
        
    }
    
    func logout() {
        UserDefaults.standard.set(false, forKey: "status")
        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
        if let delegate = delegate as? TransactionsViewController {
            delegate.dismiss(animated: true)
        }
    }
}
