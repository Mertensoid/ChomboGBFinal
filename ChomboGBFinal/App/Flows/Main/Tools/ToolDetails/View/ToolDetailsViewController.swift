//
//  ToolDetailsViewController.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

class ToolDetailsViewController: UIViewController {

    // MARK: - Public properties
    
    var presenter: ToolDetailsPresenter?
    
    // MARK: - Private Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Public functions
    
    // MARK: - Private functions

}

extension ToolDetailsViewController: ToolDetailsViewInputProtocol {
    
}
