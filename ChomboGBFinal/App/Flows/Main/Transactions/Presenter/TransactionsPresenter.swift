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
    
}
