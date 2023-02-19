//
//  SettingsViewInputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 17.02.2023.
//

import UIKit

protocol SettingsViewInputDelegate: AnyObject {
    func setNewAvatar(picture: UIImage)
    func setCurrentAvatar(picture: UIImage)
    func setCurrentFirstName(firstName: String)
    func setCurrentSecondName(secondName: String)
    func setCurrentMiddleName(middleName: String)
    func setCurrentPost(post: String)
    func setCurrentLocation(location: String)
    func setCurrentPhone(phone: String)
    func getNewAvatar() -> UIImage
    func getNewFirstName() -> String
    func getNewSecondName() -> String
    func getNewMiddleName() -> String
    func getNewPassword() -> String
    func getNewPost() -> String
    func getNewLocation() -> String
    func getNewPhone() -> String
}
