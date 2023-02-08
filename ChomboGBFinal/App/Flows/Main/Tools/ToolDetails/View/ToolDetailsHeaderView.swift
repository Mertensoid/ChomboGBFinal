//
//  ToolDetailsHeaderView.swift
//  ChomboGBFinal
//
//  Created by admin on 03.02.2023.
//

import UIKit

class ToolDetailsHeaderView: UIView {
    
    // MARK: - Public properties
    
    let leftHeaderButton: UIButton = {
        let leftHeaderButton = UIButton()
        leftHeaderButton.activateConstraints()
        leftHeaderButton.tintColor = ColorConstants.baseWhite
        leftHeaderButton.setTitle("Back", for: .normal)
        return leftHeaderButton
    }()
    
    // MARK: - Private properties
    
    private let headerTitle: UILabel = {
        let headerTitle = UILabel()
        headerTitle.activateConstraints()
        headerTitle.font = UIFont(name: "Helvetica-Bold", size: 24)
        headerTitle.textAlignment = .center
        headerTitle.numberOfLines = 1
        headerTitle.minimumScaleFactor = 0.5
        headerTitle.adjustsFontSizeToFitWidth = true
        headerTitle.textColor = ColorConstants.baseWhite
        headerTitle.text = "Tool details"
        return headerTitle
    }()
    
    // MARK: - Construction
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configureConstraints()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func addViews() {
        addSubview(headerTitle)
        addSubview(leftHeaderButton)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            headerTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerTitle.centerYAnchor.constraint(equalTo: topAnchor, constant: 72),
            headerTitle.widthAnchor.constraint(equalToConstant: frame.width / 2),
            
            leftHeaderButton.centerYAnchor.constraint(equalTo: topAnchor, constant: 72),
            leftHeaderButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            leftHeaderButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureViews() {
        
        backgroundColor = ColorConstants.darkYellow
    }
}