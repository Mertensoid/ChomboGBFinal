//
//  ToolDetailsTechInfoView.swift
//  ChomboGBFinal
//
//  Created by admin on 08.02.2023.
//

import UIKit

final class ToolDetailsTechInfoView: UIView {
    
    // MARK: - Private properties

    private let backgroundView: UIView = {
        let view = UIView()
        view.activateConstraints()
        view.backgroundColor = ColorConstants.darkYellow
        return view
    }()
    private let conditionTitleLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.textColor = ColorConstants.baseBlack
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.text = "Category"
        return label
    }()
    private let conditionDataLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.textColor = ColorConstants.baseWhite
        return label
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
    
    // MARK: - Public functions
    
    func setConditionData(data: String) {
        conditionDataLabel.text = data
    }
    
    // MARK: - Private functions
    
    private func addViews() {
        
        addSubview(backgroundView)
        addSubview(conditionTitleLabel)
        addSubview(conditionDataLabel)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            conditionTitleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            conditionTitleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            conditionTitleLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -10),
            
            conditionDataLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            conditionDataLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
        ])
    }
    
    private func configureViews() {
        
        backgroundColor = ColorConstants.baseWhite
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.masksToBounds = true
    }
}

