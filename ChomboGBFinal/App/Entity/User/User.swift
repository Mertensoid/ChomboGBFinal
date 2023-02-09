//
//  User.swift
//  ChomboGBFinal
//
//  Created by admin on 09.02.2023.
//

import Foundation

class User {
    let uid: String
    let email: String?
    let displayName: String?
    let phoneNumber: String?
    let photoUrl: URL?
    
    init(uid: String, email: String?, displayName: String?, phoneNumber: String?, photoUrl: URL?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
        self.phoneNumber = phoneNumber
        self.photoUrl = photoUrl
    }
}
