//
//  ProfilePresenter.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import Foundation

class ProfilePresenter {
    weak var delegate: ProfileViewInputDelegate?
}

extension ProfilePresenter: ProfileViewOutputDelegate {
//    func logout() {
//        if let delegate = delegate as? ProfileViewController {
//            delegate.dismiss(animated: true)
//        }
//    }
    
    func showEditProfileScreen() {
        if let delegate = delegate as? ProfileViewController {
            let newToolVC = SettingsBuilder.createSettingsScreen()
            delegate.navigationController?.pushViewController(newToolVC, animated: true)
        }
    }
    
    func updateUserInformation() {
        delegate?.showName(name: "Matsuk Maxim")
        delegate?.showPost(post: "CEO of Chombo corp.")
        delegate?.showEmail(email: "ma*******@yandex.ru")
        delegate?.showWorkspaceLocation(location: "2066 Crist Dr, Los Altos, California")
        delegate?.showMetrics()
    }
    
    func logout() {
        UserDefaults.standard.set(false, forKey: "status")
        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
        if let delegate = delegate as? ProfileViewController {
            delegate.dismiss(animated: true)
        }
    }
    
    
}
