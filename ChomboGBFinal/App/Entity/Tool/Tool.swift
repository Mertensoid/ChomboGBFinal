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

extension Tool {
    static let catalog = [
        Tool(
            id: "1",
            category: Category.handTools,
            brand: "Stanley",
            model: "XT-101 Complex",
            serial: "AD756HY777",
            productionDate: Date(),
            status: Status.free,
            owner: User(
                uid: "12345",
                email: "ma*****@yandex.ru",
                displayName: "Vasya Pupkin",
                phoneNumber: "+79155555555",
                photoUrl: nil),
            condition: Condition.incomplete,
            picture: UIImage(named: "hand_tools_complect")!
        ),
        Tool(
            id: "2",
            category: Category.electroTools,
            brand: "Makita",
            model: "PM10",
            serial: "AD756HY777",
            productionDate: Date(),
            status: Status.inUse,
            owner: User(
                uid: "12345",
                email: "ma*****@yandex.ru",
                displayName: "Vasya Pupkin",
                phoneNumber: "+79155555555",
                photoUrl: nil),
            condition: Condition.working,
            picture: UIImage(named: "screwdriver")!
        ),
        Tool(
            id: "3",
            category: Category.electroTools,
            brand: "Интерскол",
            model: "Ударник",
            serial: "AD756HY777",
            productionDate: Date(),
            status: Status.broken,
            owner: User(
                uid: "12345",
                email: "ma*****@yandex.ru",
                displayName: "Vasya Pupkin",
                phoneNumber: "+79155555555",
                photoUrl: nil),
            condition: Condition.broken,
            picture: UIImage(named: "drill")!
        ),
        Tool(
            id: "4",
            category: Category.handTools,
            brand: "Navigator",
            model: "200 mm",
            serial: "AD756HY777",
            productionDate: Date(),
            status: Status.free,
            owner: User(
                uid: "12345",
                email: "ma*****@yandex.ru",
                displayName: "Vasya Pupkin",
                phoneNumber: "+79155555555",
                photoUrl: nil),
            condition: Condition.new,
            picture: UIImage(named: "pliers")!
        ),
        Tool(
            id: "5",
            category: Category.pnevmaticTools,
            brand: "Fiac",
            model: "Pnevmo-1000",
            serial: "AD756HY777",
            productionDate: Date(),
            status: Status.inProgress,
            owner: User(
                uid: "12345",
                email: "ma*****@yandex.ru",
                displayName: "Vasya Pupkin",
                phoneNumber: "+79155555555",
                photoUrl: nil),
            condition: Condition.working,
            picture: UIImage(named: "compressor")!
        ),
        Tool(
            id: "6",
            category: Category.safetyTools,
            brand: "Camp",
            model: "Mountain",
            serial: "AD756HY777",
            productionDate: Date(),
            status: Status.free,
            owner: User(
                uid: "12345",
                email: "ma*****@yandex.ru",
                displayName: "Vasya Pupkin",
                phoneNumber: "+79155555555",
                photoUrl: nil),
            condition: Condition.outdated,
            picture: UIImage(named: "strapping")!
        ),
        Tool(
            id: "7",
            category: Category.electroTools,
            brand: "Digital",
            model: "Multimeter",
            serial: "AD756HY777",
            productionDate: Date(),
            status: Status.free,
            owner: User(
                uid: "12345",
                email: "ma*****@yandex.ru",
                displayName: "Vasya Pupkin",
                phoneNumber: "+79155555555",
                photoUrl: nil),
            condition: Condition.working,
            picture: UIImage(named: "tester")!
        ),
        Tool(
            id: "8",
            category: Category.electroTools,
            brand: "Lukey",
            model: "852D",
            serial: "AD756HY777",
            productionDate: Date(),
            status: Status.inService,
            owner: User(
                uid: "12345",
                email: "ma*****@yandex.ru",
                displayName: "Vasya Pupkin",
                phoneNumber: "+79155555555",
                photoUrl: nil),
            condition: Condition.broken,
            picture: UIImage(named: "soldering_station")!
        ),
        Tool(
            id: "9",
            category: Category.officeEquipment,
            brand: "Biltema",
            model: "24-213",
            serial: "AD756HY777",
            productionDate: Date(),
            status: Status.free,
            owner: User(
                uid: "12345",
                email: "ma*****@yandex.ru",
                displayName: "Vasya Pupkin",
                phoneNumber: "+79155555555",
                photoUrl: nil),
            condition: Condition.new,
            picture: UIImage(named: "calculator")!
        ),
    ]
}
