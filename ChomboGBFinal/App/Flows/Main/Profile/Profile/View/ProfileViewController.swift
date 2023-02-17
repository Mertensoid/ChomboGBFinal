//
//  ProfileViewController.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: ProfileViewOutputDelegate?
    
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
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.activateConstraints()
        return view
    }()
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.activateConstraints()
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 24)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 1
        nameLabel.minimumScaleFactor = 0.5
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
    private let metricsTitleView: ProfileMetricsTitleView = {
        let metricsTitleView = ProfileMetricsTitleView(frame: CGRect(x: 0, y: 0, width: 1, height: 1), textLabelText: "Metrics")
        metricsTitleView.activateConstraints()
        return metricsTitleView
    }()
    private let editProfileButton: UIButton = {
        let editProfileButton = UIButton()
        editProfileButton.activateConstraints()
        editProfileButton.setTitle("Edit profile", for: .normal)
        editProfileButton.backgroundColor = ColorConstants.darkYellow
        editProfileButton.layer.cornerRadius = 25
        editProfileButton.setOpacity()
        editProfileButton.makeTapWithButtonShadow()
        return editProfileButton
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        configureConstraints()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.updateUserInformation()
    }
    
    //MARK: - Private functions
    
    private func addViews() {
        
        view.addSubview(headerView)
        view.addSubview(avatarView)
        view.addSubview(scrollView)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(postLabel)
        scrollView.addSubview(emailTitleView)
        scrollView.addSubview(locationTitleView)
        scrollView.addSubview(metricsTitleView)
        view.addSubview(editProfileButton)
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
            
            scrollView.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
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
            
            metricsTitleView.topAnchor.constraint(equalTo: locationTitleView.bottomAnchor, constant: 10),
            metricsTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            metricsTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            metricsTitleView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            editProfileButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10),
            editProfileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            editProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            editProfileButton.heightAnchor.constraint(equalToConstant: 50),
            editProfileButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    private func configureViews() {
        
        view.backgroundColor = ColorConstants.baseWhite
        
        headerView.leftHeaderButton.addTarget(self, action: #selector(logoutButtonPressed(_:)), for: .touchUpInside)
        
        headerView.rightHeaderButton.addTarget(self, action: #selector(goToSettingsScreen(_:)), for: .touchUpInside)
        
        editProfileButton.addTarget(self, action: #selector(goToSettingsScreen(_:)), for: .touchUpInside)
    }
    
    @objc private func goToSettingsScreen(_ sender: UIButton) {
        presenter?.showEditProfileScreen()
    }
    
    @objc private func logoutButtonPressed(_ sender: UIButton) {
        presenter?.logout()
    }
}

extension ProfileViewController: ProfileViewInputDelegate {
    func showName(name: String) {
        nameLabel.text = name
    }
    
    func showPost(post: String) {
        postLabel.text = post
    }
    
    func showEmail(email: String) {
        emailTitleView.setDataText(data: email)
    }
    
    func showWorkspaceLocation(location: String) {
        locationTitleView.setDataText(data: location)
    }
    
    func showMetrics() {
        metricsTitleView.setInUseDataText(data: "0")
        metricsTitleView.setInProgressDataText(data: "0")
        metricsTitleView.setDoneDataText(data: "0")
        metricsTitleView.setActivityDataText(data: "0%")
    }
}
