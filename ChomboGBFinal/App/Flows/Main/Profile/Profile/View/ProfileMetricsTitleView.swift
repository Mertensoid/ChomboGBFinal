//
//  ProfileMetricsTitleView.swift
//  ChomboGBFinal
//
//  Created by admin on 02.02.2023.
//

import UIKit

final class ProfileMetricsTitleView: UIView {
    
    // MARK: - Private properties

    private let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.activateConstraints()
        textLabel.textColor = ColorConstants.baseBlack
        textLabel.font = UIFont(name: "Helvetica", size: 16)
        textLabel.numberOfLines = 1
        textLabel.minimumScaleFactor = 0.5
        textLabel.adjustsFontSizeToFitWidth = true
        return textLabel
    }()
    private let inUseTitleLabel: UILabel = {
        let inUseTitleLabel = UILabel()
        inUseTitleLabel.activateConstraints()
        inUseTitleLabel.font = UIFont(name: "Helvetica", size: 16)
        inUseTitleLabel.numberOfLines = 1
        inUseTitleLabel.minimumScaleFactor = 0.5
        inUseTitleLabel.adjustsFontSizeToFitWidth = true
        inUseTitleLabel.text = "Tools in use"
        inUseTitleLabel.textColor = ColorConstants.checkBoxTitleGray
        return inUseTitleLabel
    }()
    private let inProgressTitleLabel: UILabel = {
        let inProgressTitleLabel = UILabel()
        inProgressTitleLabel.activateConstraints()
        inProgressTitleLabel.font = UIFont(name: "Helvetica", size: 16)
        inProgressTitleLabel.numberOfLines = 1
        inProgressTitleLabel.minimumScaleFactor = 0.5
        inProgressTitleLabel.adjustsFontSizeToFitWidth = true
        inProgressTitleLabel.text = "Transactions in progress"
        inProgressTitleLabel.textColor = ColorConstants.checkBoxTitleGray
        return inProgressTitleLabel
    }()
    private let doneTitleLabel: UILabel = {
        let doneTitleLabel = UILabel()
        doneTitleLabel.activateConstraints()
        doneTitleLabel.font = UIFont(name: "Helvetica", size: 16)
        doneTitleLabel.numberOfLines = 1
        doneTitleLabel.minimumScaleFactor = 0.5
        doneTitleLabel.adjustsFontSizeToFitWidth = true
        doneTitleLabel.text = "Transactions done"
        doneTitleLabel.textColor = ColorConstants.checkBoxTitleGray
        return doneTitleLabel
    }()
    private let activityTitleLabel: UILabel = {
        let activityTitleLabel = UILabel()
        activityTitleLabel.activateConstraints()
        activityTitleLabel.font = UIFont(name: "Helvetica", size: 16)
        activityTitleLabel.numberOfLines = 1
        activityTitleLabel.minimumScaleFactor = 0.5
        activityTitleLabel.adjustsFontSizeToFitWidth = true
        activityTitleLabel.text = "Activity score"
        activityTitleLabel.textColor = ColorConstants.checkBoxTitleGray
        return activityTitleLabel
    }()
    private let inUseDataLabel: UILabel = {
        let inUseDataLabel = UILabel()
        inUseDataLabel.activateConstraints()
        inUseDataLabel.font = UIFont(name: "Helvetica", size: 16)
        inUseDataLabel.numberOfLines = 1
        inUseDataLabel.minimumScaleFactor = 0.5
        inUseDataLabel.adjustsFontSizeToFitWidth = true
        inUseDataLabel.textColor = ColorConstants.baseBlack
        return inUseDataLabel
    }()
    private let inProgressDataLabel: UILabel = {
        let inProgressDataLabel = UILabel()
        inProgressDataLabel.activateConstraints()
        inProgressDataLabel.font = UIFont(name: "Helvetica", size: 16)
        inProgressDataLabel.numberOfLines = 1
        inProgressDataLabel.minimumScaleFactor = 0.5
        inProgressDataLabel.adjustsFontSizeToFitWidth = true
        inProgressDataLabel.textColor = ColorConstants.baseBlack
        return inProgressDataLabel
    }()
    private let doneDataLabel: UILabel = {
        let doneDataLabel = UILabel()
        doneDataLabel.activateConstraints()
        doneDataLabel.font = UIFont(name: "Helvetica", size: 16)
        doneDataLabel.numberOfLines = 1
        doneDataLabel.minimumScaleFactor = 0.5
        doneDataLabel.adjustsFontSizeToFitWidth = true
        doneDataLabel.textColor = ColorConstants.baseBlack
        return doneDataLabel
    }()
    private let activityDataLabel: UILabel = {
        let activityDataLabel = UILabel()
        activityDataLabel.activateConstraints()
        activityDataLabel.font = UIFont(name: "Helvetica", size: 16)
        activityDataLabel.numberOfLines = 1
        activityDataLabel.minimumScaleFactor = 0.5
        activityDataLabel.adjustsFontSizeToFitWidth = true
        activityDataLabel.textColor = ColorConstants.baseBlack
        return activityDataLabel
    }()
    private let divider: UIView = {
        let divider = UIView()
        divider.activateConstraints()
        divider.backgroundColor = ColorConstants.darkYellow
        return divider
    }()
    
    // MARK: - Construction
    
    init(frame: CGRect, textLabelText: String) {
        super.init(frame: frame)
        
        addViews()
        configureConstraints()
        configureViews(textLabelText: textLabelText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public functions
    
    func setInUseDataText(data: String) {
        inUseDataLabel.text = data
    }
    func setInProgressDataText(data: String) {
        inProgressDataLabel.text = data
    }
    func setDoneDataText(data: String) {
        doneDataLabel.text = data
    }
    func setActivityDataText(data: String) {
        activityDataLabel.text = data
    }
    
    // MARK: - Private functions
    
    private func addViews() {
        
        addSubview(textLabel)
        addSubview(divider)
        addSubview(inUseTitleLabel)
        addSubview(inUseDataLabel)
        addSubview(inProgressTitleLabel)
        addSubview(inProgressDataLabel)
        addSubview(doneTitleLabel)
        addSubview(doneDataLabel)
        addSubview(activityTitleLabel)
        addSubview(activityDataLabel)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            divider.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 5),
            divider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            inUseTitleLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 5),
            inUseTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            inUseDataLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 5),
            inUseDataLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            inProgressTitleLabel.topAnchor.constraint(equalTo: inUseTitleLabel.bottomAnchor, constant: 10),
            inProgressTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            inProgressDataLabel.topAnchor.constraint(equalTo: inUseDataLabel.bottomAnchor, constant: 10),
            inProgressDataLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            doneTitleLabel.topAnchor.constraint(equalTo: inProgressTitleLabel.bottomAnchor, constant: 10),
            doneTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            doneDataLabel.topAnchor.constraint(equalTo: inProgressDataLabel.bottomAnchor, constant: 10),
            doneDataLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            activityTitleLabel.topAnchor.constraint(equalTo: doneTitleLabel.bottomAnchor, constant: 10),
            activityTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            activityTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            activityDataLabel.topAnchor.constraint(equalTo: doneDataLabel.bottomAnchor, constant: 10),
            activityDataLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
        ])
    }
    
    private func configureViews(textLabelText: String) {
        
        backgroundColor = ColorConstants.backgroundGray
        layer.cornerRadius = 10
        layer.borderColor = ColorConstants.borderGray.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
        
        textLabel.text = textLabelText
    }
}
