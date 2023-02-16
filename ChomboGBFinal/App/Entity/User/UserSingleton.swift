//
//  UserSingleton.swift
//  ChomboGBFinal
//
//  Created by admin on 16.02.2023.
//

import Foundation

final class UserSingleton {
    static let shared = UserSingleton()

    private init() {}

    var user: User? = nil
}
