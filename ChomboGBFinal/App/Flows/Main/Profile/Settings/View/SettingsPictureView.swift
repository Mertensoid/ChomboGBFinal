//
//  SettingsPictureView.swift
//  ChomboGBFinal
//
//  Created by admin on 17.02.2023.
//

import UIKit

class SettingsPictureView: UIView {
    
    // MARK: - Properties
    
    var avatarView: UIButton = {
        let avatarView = UIButton()
        avatarView.activateConstraints()
        avatarView.layer.cornerRadius = 46
        avatarView.layer.masksToBounds = true
        return avatarView
    }()
    
    // MARK: - Private properties
    
    private let backGroundView: UIView = {
        let backGroundView = UIView()
        backGroundView.activateConstraints()
        backGroundView.backgroundColor = ColorConstants.baseWhite
        backGroundView.layer.cornerRadius = 50
        return backGroundView
    }()
    
    private let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.activateConstraints()
        textLabel.textColor = ColorConstants.baseBlack
        textLabel.font = UIFont(name: "Helvetica-Bold", size: 16)
        textLabel.numberOfLines = 1
        textLabel.minimumScaleFactor = 0.5
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.text = "User avatar"
        return textLabel
    }()
    private let textField: UILabel = {
        let textField = UILabel()
        textField.activateConstraints()
        textField.font = UIFont(name: "Helvetica", size: 16)
        textField.textColor = ColorConstants.subtitleGray
        textField.numberOfLines = 0
        textField.text = "Press image to change avatar"
        return textField
    }()
    private let underline: UIView = {
        let underline = UIView()
        underline.activateConstraints()
        underline.backgroundColor = ColorConstants.darkYellow
        return underline
    }()
    
    // MARK: - Construction
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        addViews()
        configureConstraints()
        configureViews()
        avatarView.setImage(UIImage(named: "123"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func addViews() {
        
        addSubview(backGroundView)
        addSubview(avatarView)
        addSubview(textLabel)
        addSubview(underline)
        addSubview(textField)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            
            backGroundView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            backGroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            backGroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backGroundView.widthAnchor.constraint(equalToConstant: 100),
            backGroundView.heightAnchor.constraint(equalToConstant: 100),
            
            avatarView.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 4),
            avatarView.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor, constant: -4),
            avatarView.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 4),
            avatarView.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -4),
            
            textLabel.topAnchor.constraint(equalTo: backGroundView.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: 10),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            underline.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 5),
            underline.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor),
            underline.trailingAnchor.constraint(equalTo: textLabel.trailingAnchor),
            underline.heightAnchor.constraint(equalToConstant: 1),
            
            textField.topAnchor.constraint(equalTo: underline.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: underline.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: underline.trailingAnchor)
        ])
    }
    
    private func configureViews() {
        backgroundColor = ColorConstants.backgroundGray
        layer.cornerRadius = 10
        layer.borderColor = ColorConstants.borderGray.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
    }
}
