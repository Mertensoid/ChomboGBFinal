//
//  Tool.swift
//  ChomboGBFinal
//
//  Created by admin on 09.02.2023.
//

import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

class Tool: Identifiable, Codable {
//    var id: String
//    @DocumentID var id: String?
    var id = UUID()
    var category: Category
    var brand: String
    var model: String
    var serial: String?
    var productionDate: Date
    var status: Status
    var owner: User
    var condition: Condition
    
    init(category: Category, brand: String, model: String, serial: String?, productionDate: Date, status: Status, owner: User, condition: Condition) {
            self.category = category
            self.brand = brand
            self.model = model
            self.serial = serial
            self.productionDate = productionDate
            self.status = status
            self.owner = owner
            self.condition = condition
        }
}
