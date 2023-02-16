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
    func showEditProfileScreen() {
        
    }
    
    func updateUserInformation() {
        delegate?.showName(name: "Matsuk Maxim")
        delegate?.showPost(post: "CEO of Chombo corp.")
        delegate?.showEmail(email: "ma*******@yandex.ru")
        delegate?.showWorkspaceLocation(location: "2066 Crist Dr, Los Altos, California")
        delegate?.showMetrics()
    }
    
    
}
