//
//  MockNetworkService.swift
//  ChomboGBFinal
//
//  Created by admin on 16.02.2023.
//

import UIKit

class MockNetworkService {
    func auth(login: String, password: String) -> User? {
        print("Провереяем данные")
        print("Данные верны")
        return User(uid: "123456", email: "test@email.ru", displayName: "Имя Фамилия", phoneNumber: "+1234567890", photoUrl: URL(string: "http://testURL"))
    }
    
    func registration(login: String, email: String, password: String) -> Int {
        print("Отправляем данные")
        print("Проверяем на совпадения")
        print("Возвращаем 1 при успешной регистрации, 0 при наличии email в базе")
        return 1
    }
    
    func saveNewTool(tool: Tool) -> Int {
        print("Отправляем данные")
        print("Проверяем на совпадения")
        print("Возвращаем 1 при успешном сохранении, 0 при ???")
        return 1
    }
    
    func  getTool(id: String) -> Tool {
        print("Отправляем id инструмента")
        print("Ищем...")
        print("Возвращаем инструмент")
        
        return Tool(
            //id: "123",
            category: Category.miscellaneous,
            brand: "",
            model: "",
            serial: "",
            productionDate: Date(),
            status: Status.free,
            owner: User(uid: "123456", email: "test@email.ru", displayName: "Имя Фамилия", phoneNumber: "+1234567890", photoUrl: URL(string: "http://testURL")),
            condition: Condition.broken
            //picture: UIImage(systemName: "hammer") ?? UIImage()
        )
    }
    
    func getCatalog() -> [Tool] {
        print("Отправляем запрос")
        print("Обрабатываем...")
        print("Возвращаем каталог")
        
        return Tool.catalog
    }
}
