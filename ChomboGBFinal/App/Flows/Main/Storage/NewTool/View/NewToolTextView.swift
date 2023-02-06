//
//  NewToolTextView.swift
//  ChomboGBFinal
//
//  Created by admin on 27.01.2023.
//

import UIKit

final class NewToolTextView: UIView {
    
    // MARK: - Private properties

    private let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.activateConstraints()
        textLabel.textColor = ColorConstants.baseBlack
        textLabel.font = UIFont(name: "Helvetica-Bold", size: 16)
        textLabel.numberOfLines = 1
        textLabel.minimumScaleFactor = 0.5
        textLabel.adjustsFontSizeToFitWidth = true
        return textLabel
    }()
    private let textField: UITextField = {
        let textField = UITextField()
        textField.activateConstraints()
        textField.font = UIFont(name: "Helvetica", size: 16)
        textField.textColor = ColorConstants.baseBlack
        textField.borderStyle = .none
        textField.backgroundColor = .none
        return textField
    }()
    private let underline: UIView = {
        let underline = UIView()
        underline.activateConstraints()
        underline.backgroundColor = ColorConstants.darkYellow
        return underline
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
    
    //MARK: - Private functions
    
    private func addViews() {
        
        addSubview(textLabel)
        addSubview(textField)
        addSubview(underline)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            underline.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            underline.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            underline.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            underline.heightAnchor.constraint(equalToConstant: 1)
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
