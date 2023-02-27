//
//  TransactionsBuilder.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

class TransactionsBuilder {
    static func createTransactionsScreen() -> UIViewController {
        let transactionsView = TransactionsViewController()
        let transactionsPresenter = TransactionsPresenter()
        transactionsView.presenter = transactionsPresenter
        transactionsPresenter.delegate = transactionsView
        return transactionsView
    }
}
