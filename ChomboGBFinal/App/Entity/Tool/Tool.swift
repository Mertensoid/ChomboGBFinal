//
//  Tool.swift
//  ChomboGBFinal
//
//  Created by admin on 09.02.2023.
//

import UIKit

class Tool {
    var id: String
    var category: Category
    var brand: String
    var model: String
    var serial: String?
    var productionDate: Date
    var status: Status
    var owner: User
    var condition: Condition
    var picture: UIImage
    
    init(id: String, category: Category, brand: String, model: String, serial: String?, productionDate: Date,
         status: Status, owner: User, condition: Condition, picture: UIImage) {
            self.id = id
            self.category = category
            self.brand = brand
            self.model = model
            self.serial = serial
            self.productionDate = productionDate
            self.status = status
            self.owner = owner
            self.condition = condition
            self.picture = picture
        }
}
