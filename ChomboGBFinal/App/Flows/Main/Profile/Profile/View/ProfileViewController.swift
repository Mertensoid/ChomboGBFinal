//
//  ProfileViewController.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let headerView: ProfileHeaderView = {
        let headerView = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        headerView.activateConstraints()
        return headerView
    }()
    private let avatarView: ProfileAvatarView = {
        let avatarView = ProfileAvatarView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        avatarView.activateConstraints()
        return avatarView
    }()
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.activateConstraints()
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 24)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 1
        nameLabel.minimumScaleFactor = 0.5
        nameLabel.text = "Matsuk Maxim"
        nameLabel.textColor = ColorConstants.baseBlack
        nameLabel.backgroundColor = ColorConstants.baseWhite
        nameLabel.adjustsFontSizeToFitWidth = true
        return nameLabel
    }()
    private let postLabel: UILabel = {
        let postLabel = UILabel()
        postLabel.activateConstraints()
        postLabel.font = UIFont(name: "Helvetica", size: 16)
        postLabel.textAlignment = .center
        postLabel.numberOfLines = 1
        postLabel.minimumScaleFactor = 0.5
        postLabel.text = "CEO of Chombo corp."
        postLabel.textColor = ColorConstants.baseBlack
        postLabel.backgroundColor = ColorConstants.baseWhite
        postLabel.adjustsFontSizeToFitWidth = true
        return postLabel
    }()
    private let emailTitleView: ProfileTitleView = {
        let emailTitleView = ProfileTitleView(frame: CGRect(x: 0, y: 0, width: 1, height: 1), textLabelText: "E-mail")
        emailTitleView.activateConstraints()
        return emailTitleView
    }()
    private let locationTitleView: ProfileTitleView = {
        let locationTitleView = ProfileTitleView(frame: CGRect(x: 0, y: 0, width: 1, height: 1), textLabelText: "Workspace location")
        locationTitleView.activateConstraints()
        return locationTitleView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        configureConstraints()
        configureViews()
    }
    
    //MARK: - Private functions
    
    private func addViews() {
        
        view.addSubview(headerView)
        view.addSubview(avatarView)
        view.addSubview(nameLabel)
        view.addSubview(postLabel)
        view.addSubview(emailTitleView)
        view.addSubview(locationTitleView)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 220),
            
            avatarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            avatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarView.heightAnchor.constraint(equalToConstant: 150),
            avatarView.widthAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            postLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            postLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailTitleView.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: 10),
            emailTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            emailTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            emailTitleView.heightAnchor.constraint(equalToConstant: 70),
            
            locationTitleView.topAnchor.constraint(equalTo: emailTitleView.bottomAnchor, constant: 10),
            locationTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            locationTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            locationTitleView.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    private func configureViews() {
        
        view.backgroundColor = ColorConstants.baseWhite
        emailTitleView.setDataText(data: "ma*******@yandex.ru")
        locationTitleView.setDataText(data: "2066 Crist Dr, Los Altos, California")
    }
}

