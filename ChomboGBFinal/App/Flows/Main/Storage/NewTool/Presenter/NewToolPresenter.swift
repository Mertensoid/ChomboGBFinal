//
//  NewToolPresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import Foundation

class NewToolPresenter {
    
    var mockData = MockTool.mockTools
    
    weak private var viewInputDelegate: NewToolViewInputDelegate?
    
    func setViewInputDelegate(viewInputDelegate: NewToolViewInputDelegate?) {
        self.viewInputDelegate = viewInputDelegate
    }
    
    func loadTestData() {
        self.viewInputDelegate?.setupData(with: self.mockData)
        self.viewInputDelegate?.displayData(index: 0)
    }
}

extension NewToolPresenter: NewToolViewOutputDelegate {
    
    func getData() {
        self.loadTestData()
    }
    
    func saveData() {
        
    }
}
