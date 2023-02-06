//
//  ProfileAvatarView.swift
//  ChomboGBFinal
//
//  Created by admin on 02.02.2023.
//

import UIKit

class ProfileAvatarView: UIView {
    
    // MARK: - Private properties
    
    private let backGroundView: UIView = {
        let backGroundView = UIView()
        backGroundView.activateConstraints()
        backGroundView.backgroundColor = ColorConstants.baseWhite
        backGroundView.layer.cornerRadius = 75
        return backGroundView
    }()
    private let avatarView: UIImageView = {
        let avatarView = UIImageView()
        avatarView.activateConstraints()
        avatarView.image = UIImage(named: "magister_284x284px")
        avatarView.layer.cornerRadius = 71
        avatarView.layer.masksToBounds = true
        return avatarView
    }()
    
    // MARK: - Construction
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        addViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func addViews() {
        
        addSubview(backGroundView)
        addSubview(avatarView)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            
            backGroundView.topAnchor.constraint(equalTo: topAnchor),
            backGroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backGroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            avatarView.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 4),
            avatarView.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor, constant: -4),
            avatarView.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 4),
            avatarView.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -4)
        ])
    }
}
