//
//  MockTool.swift
//  ChomboGBFinal
//
//  Created by admin on 31.01.2023.
//

import UIKit

class MockTool {
    var id: Int
    var category: MockCategory
    var brand: String
    var model: String
    var serial: String
    var productionDate: Date
    var status: MockStatus
    var owner: MockUser
    var condition: MockCondition
    var location: MockLocation
    var picture: UIImage
    
    init(
        id: Int,
        category: MockCategory,
        brand: String,
        model: String,
        serial: String,
        productionDate: Date,
        status: MockStatus,
        owner: MockUser,
        condition: MockCondition,
        location: MockLocation,
        picture: UIImage) {
            self.id = id
            self.category = category
            self.brand = brand
            self.model = model
            self.serial = serial
            self.productionDate = productionDate
            self.status = status
            self.owner = owner
            self.condition = condition
            self.location = location
            self.picture = picture
        }
}

enum MockCategory: String {
    case handTools = "Ручной инструмент"
    case electroTools = "Электроинструмент"
    case gasolineTools = "Бензиновый инструмент"
}

enum MockStatus: String {
    case free = "Доступен"
    case inUse = "В работе"
    case broken = "Неисправен"
}

class MockUser {
    var userID: Int
    var userName: String
    var accountType: MockAccessType
    
    init(userID: Int, userName: String, accountType: MockAccessType) {
        self.userID = userID
        self.userName = userName
        self.accountType = accountType
    }
}

enum MockAccessType: String {
    case user = "Пользователь"
    case admin = "Администратор"
}

enum MockCondition: String {
    case excellent = "Отличное"
    case good = "Хорошее"
    case normal = "Удовлетворительное"
    case broken = "Неудовлетворительное"
}

class MockLocation {
    var latitude: Float
    var longitude: Float
    
    init(latitude: Float, longitude: Float) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension MockTool {
    static var mockTools = [
        MockTool(
            id: 1,
            category: MockCategory.handTools,
            brand: "Stanley",
            model: "XT-101 Lumberjack",
            serial: "AD756HY777",
            productionDate: Date(),
            status: MockStatus.free,
            owner: MockUser(
                userID: 1,
                userName: "Вася Пупкин",
                accountType: MockAccessType.admin),
            condition: MockCondition.normal,
            location: MockLocation(
                latitude: 31.0005434,
                longitude: 65.4643721),
            picture: UIImage(systemName: "tool")!
        ),
        MockTool(
            id: 2,
            category: MockCategory.handTools,
            brand: "Stanley",
            model: "XT-101 Lumberjack",
            serial: "AD756HY777",
            productionDate: Date(),
            status: MockStatus.free,
            owner: MockUser(
                userID: 1,
                userName: "Вася Пупкин",
                accountType: MockAccessType.admin),
            condition: MockCondition.normal,
            location: MockLocation(
                latitude: 31.0005434,
                longitude: 65.4643721),
            picture: UIImage(systemName: "tool")!
        ),
        MockTool(
            id: 3,
            category: MockCategory.handTools,
            brand: "Stanley",
            model: "XT-101 Lumberjack",
            serial: "AD756HY777",
            productionDate: Date(),
            status: MockStatus.free,
            owner: MockUser(
                userID: 1,
                userName: "Вася Пупкин",
                accountType: MockAccessType.admin),
            condition: MockCondition.normal,
            location: MockLocation(
                latitude: 31.0005434,
                longitude: 65.4643721),
            picture: UIImage(systemName: "tool")!
        ),
        MockTool(
            id: 4,
            category: MockCategory.handTools,
            brand: "Stanley",
            model: "XT-101 Lumberjack",
            serial: "AD756HY777",
            productionDate: Date(),
            status: MockStatus.free,
            owner: MockUser(
                userID: 1,
                userName: "Вася Пупкин",
                accountType: MockAccessType.admin),
            condition: MockCondition.normal,
            location: MockLocation(
                latitude: 31.0005434,
                longitude: 65.4643721),
            picture: UIImage(systemName: "tool")!
        ),
        MockTool(
            id: 5,
            category: MockCategory.handTools,
            brand: "Stanley",
            model: "XT-101 Lumberjack",
            serial: "AD756HY777",
            productionDate: Date(),
            status: MockStatus.free,
            owner: MockUser(
                userID: 1,
                userName: "Вася Пупкин",
                accountType: MockAccessType.admin),
            condition: MockCondition.normal,
            location: MockLocation(
                latitude: 31.0005434,
                longitude: 65.4643721),
            picture: UIImage(systemName: "tool")!
        ),
        MockTool(
            id: 6,
            category: MockCategory.handTools,
            brand: "Stanley",
            model: "XT-101 Lumberjack",
            serial: "AD756HY777",
            productionDate: Date(),
            status: MockStatus.free,
            owner: MockUser(
                userID: 1,
                userName: "Вася Пупкин",
                accountType: MockAccessType.admin),
            condition: MockCondition.normal,
            location: MockLocation(
                latitude: 31.0005434,
                longitude: 65.4643721),
            picture: UIImage(systemName: "tool")!
        ),
        MockTool(
            id: 7,
            category: MockCategory.handTools,
            brand: "Stanley",
            model: "XT-101 Lumberjack",
            serial: "AD756HY777",
            productionDate: Date(),
            status: MockStatus.free,
            owner: MockUser(
                userID: 1,
                userName: "Вася Пупкин",
                accountType: MockAccessType.admin),
            condition: MockCondition.normal,
            location: MockLocation(
                latitude: 31.0005434,
                longitude: 65.4643721),
            picture: UIImage(systemName: "tool")!
        ),
        MockTool(
            id: 8,
            category: MockCategory.handTools,
            brand: "Stanley",
            model: "XT-101 Lumberjack",
            serial: "AD756HY777",
            productionDate: Date(),
            status: MockStatus.free,
            owner: MockUser(
                userID: 1,
                userName: "Вася Пупкин",
                accountType: MockAccessType.admin),
            condition: MockCondition.normal,
            location: MockLocation(
                latitude: 31.0005434,
                longitude: 65.4643721),
            picture: UIImage(systemName: "tool")!
        ),
        MockTool(
            id: 9,
            category: MockCategory.handTools,
            brand: "Stanley",
            model: "XT-101 Lumberjack",
            serial: "AD756HY777",
            productionDate: Date(),
            status: MockStatus.free,
            owner: MockUser(
                userID: 1,
                userName: "Вася Пупкин",
                accountType: MockAccessType.admin),
            condition: MockCondition.normal,
            location: MockLocation(
                latitude: 31.0005434,
                longitude: 65.4643721),
            picture: UIImage(systemName: "tool")!
        ),
    ]
}
