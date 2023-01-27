//
//  NewToolHeaderView.swift
//  ChomboGBFinal
//
//  Created by admin on 27.01.2023.
//

import UIKit

class NewToolHeaderView: UIView {
    
    // MARK: - Private properties
    
    private let headerTitle = UILabel()
    private let leftHeaderButton = UIButton()
    
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
        
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.font = UIFont(name: "Helvetica-Bold", size: 24)
        headerTitle.textAlignment = .center
        headerTitle.numberOfLines = 1
        headerTitle.minimumScaleFactor = 0.5
        headerTitle.adjustsFontSizeToFitWidth = true
        headerTitle.textColor = ColorConstants.baseWhite
        headerTitle.text = "Tools"
        
        leftHeaderButton.translatesAutoresizingMaskIntoConstraints = false
        leftHeaderButton.tintColor = ColorConstants.baseWhite
        leftHeaderButton.setTitle("Logout", for: .normal)
    }
}
