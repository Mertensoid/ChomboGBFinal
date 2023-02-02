//
//  ProfileTitleView.swift
//  ChomboGBFinal
//
//  Created by admin on 02.02.2023.
//

import UIKit

final class ProfileTitleView: UIView {
    
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
    private let dataLabel: UILabel = {
        let dataLabel = UILabel()
        dataLabel.activateConstraints()
        dataLabel.font = UIFont(name: "Helvetica", size: 16)
        dataLabel.numberOfLines = 1
        dataLabel.minimumScaleFactor = 0.5
        dataLabel.adjustsFontSizeToFitWidth = true
        dataLabel.textColor = ColorConstants.checkBoxTitleGray
        return dataLabel
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
    
    func setDataText(data: String) {
        dataLabel.text = data
    }
    
    // MARK: - Private functions
    
    private func addViews() {
        
        addSubview(textLabel)
        addSubview(dataLabel)
        addSubview(divider)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            dataLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            dataLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dataLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            divider.centerYAnchor.constraint(equalTo: centerYAnchor),
            divider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            divider.heightAnchor.constraint(equalToConstant: 1)
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
