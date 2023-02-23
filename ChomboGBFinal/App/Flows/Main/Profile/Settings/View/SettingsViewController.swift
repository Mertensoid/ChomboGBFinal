//
//  SettingsViewController.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Properties
    
    var presenter: SettingsViewOutputDelegate?
    
    // MARK: - Private properties
    
    private var bottomConstraint: NSLayoutConstraint?
    
    private let headerView: SettingsHeaderView = {
        let headerView = SettingsHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        headerView.activateConstraints()
        return headerView
    }()
    
    private let avatarView: SettingsPictureView = {
        let avatarView = SettingsPictureView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        avatarView.activateConstraints()
        return avatarView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.activateConstraints()
        return scrollView
    }()
    
    private let firstNameTextView: SettingsTextView = {
        let view = SettingsTextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), textLabelText: "First name")
        view.activateConstraints()
        return view
    }()
    
    private let secondNameTextView: SettingsTextView = {
        let view = SettingsTextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), textLabelText: "Second name")
        view.activateConstraints()
        return view
    }()
    
    private let middleNameTextView: SettingsTextView = {
        let view = SettingsTextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), textLabelText: "Middle name")
        view.activateConstraints()
        return view
    }()
    
    private let newPasswordTextView: SettingsTextView = {
        let view = SettingsTextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), textLabelText: "New password")
        view.activateConstraints()
        return view
    }()
    
    private let postTextView: SettingsTextView = {
        let view = SettingsTextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), textLabelText: "Post")
        view.activateConstraints()
        return view
    }()
    
    private let locationTextView: SettingsTextView = {
        let view = SettingsTextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), textLabelText: "Workspace location")
        view.activateConstraints()
        return view
    }()
    
    private let phoneTextView: SettingsTextView = {
        let view = SettingsTextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), textLabelText: "Phone number")
        view.activateConstraints()
        return view
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.activateConstraints()
        button.setTitle("Save", for: .normal)
        button.backgroundColor = ColorConstants.darkYellow
        button.layer.cornerRadius = 25
        button.setOpacity()
        button.makeTapWithButtonShadow()
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomConstraint = NSLayoutConstraint(item: saveButton, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: -10)
        
        addViews()
        configureConstraints()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    // MARK: - Private functions

    private func addViews() {
        view.addSubview(headerView)
        view.addSubview(scrollView)
        scrollView.addSubview(avatarView)
        scrollView.addSubview(firstNameTextView)
        scrollView.addSubview(secondNameTextView)
        scrollView.addSubview(middleNameTextView)
        scrollView.addSubview(newPasswordTextView)
        scrollView.addSubview(postTextView)
        scrollView.addSubview(locationTextView)
        scrollView.addSubview(phoneTextView)
        view.addSubview(saveButton)
    }
    
    private func configureConstraints() {

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 100),
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            avatarView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            avatarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            avatarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            firstNameTextView.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 10),
            firstNameTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            firstNameTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            firstNameTextView.heightAnchor.constraint(equalToConstant: 70),
            
            secondNameTextView.topAnchor.constraint(equalTo: firstNameTextView.bottomAnchor, constant: 10),
            secondNameTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            secondNameTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            secondNameTextView.heightAnchor.constraint(equalToConstant: 70),
            
            middleNameTextView.topAnchor.constraint(equalTo: secondNameTextView.bottomAnchor, constant: 10),
            middleNameTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            middleNameTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            middleNameTextView.heightAnchor.constraint(equalToConstant: 70),
            
            newPasswordTextView.topAnchor.constraint(equalTo: middleNameTextView.bottomAnchor, constant: 10),
            newPasswordTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            newPasswordTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            newPasswordTextView.heightAnchor.constraint(equalToConstant: 70),
            
            postTextView.topAnchor.constraint(equalTo: newPasswordTextView.bottomAnchor, constant: 10),
            postTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            postTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            postTextView.heightAnchor.constraint(equalToConstant: 70),
            
            locationTextView.topAnchor.constraint(equalTo: postTextView.bottomAnchor, constant: 10),
            locationTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            locationTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            locationTextView.heightAnchor.constraint(equalToConstant: 70),
            
            phoneTextView.topAnchor.constraint(equalTo: locationTextView.bottomAnchor, constant: 10),
            phoneTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            phoneTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            phoneTextView.heightAnchor.constraint(equalToConstant: 70),
            phoneTextView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            saveButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            bottomConstraint!
        ])
    }
    
    private func configureViews() {

        view.backgroundColor = ColorConstants.baseWhite
        avatarView.avatarView.addTarget(self, action: #selector(setPhoto), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        headerView.leftHeaderButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    }
}

extension SettingsViewController: SettingsViewInputDelegate {
    func setCurrentAvatar(picture: UIImage) {
        avatarView.avatarView.setImage(picture, for: .normal)
    }
    
    func setCurrentFirstName(firstName: String) {
        firstNameTextView.setPlaceholder(text: firstName)
    }
    
    func setCurrentSecondName(secondName: String) {
        secondNameTextView.setPlaceholder(text: secondName)
    }
    
    func setCurrentMiddleName(middleName: String) {
        middleNameTextView.setPlaceholder(text: middleName)
    }
    
    func setCurrentPost(post: String) {
        postTextView.setPlaceholder(text: post)
    }
    
    func setCurrentLocation(location: String) {
        locationTextView.setPlaceholder(text: location)
    }
    
    func setCurrentPhone(phone: String) {
        phoneTextView.setPlaceholder(text: phone)
    }
    
    func getNewAvatar() -> UIImage {
        return avatarView.avatarView.imageView?.image ?? UIImage()
    }
    
    func getNewFirstName() -> String {
        return firstNameTextView.getData()
    }
    
    func getNewSecondName() -> String {
        return secondNameTextView.getData()
    }
    
    func getNewMiddleName() -> String {
        return middleNameTextView.getData()
    }
    
    func getNewPassword() -> String {
        return newPasswordTextView.getData()
    }
    
    func getNewPost() -> String {
        return postTextView.getData()
    }
    
    func getNewLocation() -> String {
        return locationTextView.getData()
    }
    
    func getNewPhone() -> String {
        return phoneTextView.getData()
    }
    
    func setNewAvatar(picture: UIImage) {
        avatarView.avatarView.setImage(picture, for: .normal)
    }
}

@objc extension SettingsViewController {
    
    private func setPhoto() {
        presenter?.choosePhoto()
    }
    
    private func saveButtonPressed() {
        presenter?.saveNewData()
    }
    
    private func backButtonPressed() {
        presenter?.closeSettingsScreen()
    }
    
    private func keyboardWasShown(notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        bottomConstraint?.constant = -10 - kbSize.height + (tabBarController?.tabBar.frame.height ?? 0)
        
        UIView.animate(withDuration: 1) {
            self.saveButton.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .required
            self.saveButton.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .defaultHigh
            self.view.layoutIfNeeded()
        }
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    private func keyboardWillBeHidden(notification: Notification) {
        
        bottomConstraint?.constant = -10
        UIView.animate(withDuration: 1) {
            self.saveButton.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .defaultHigh
            self.saveButton.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .required
            self.view.layoutIfNeeded()
        }
    }
    
    private func hideKeyboard() {
        view.endEditing(true)
    }
}
