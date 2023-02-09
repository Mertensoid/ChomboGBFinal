//
//  ToolDetailsLocationView.swift
//  ChomboGBFinal
//
//  Created by admin on 03.02.2023.
//

import UIKit

final class ToolDetailsLocationView: UIView {
    
    // MARK: - Public properties
    
    let locationButton: UIButton = {
        let button = UIButton()
        button.activateConstraints()
        button.setImage(UIImage(named: "location_icon_90x54px"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    // MARK: - Private properties

    private let backgroundView: UIView = {
        let view = UIView()
        view.activateConstraints()
        view.backgroundColor = ColorConstants.darkYellow
        return view
    }()
    private let statusTitleLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.textColor = ColorConstants.baseBlack
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.text = "Status"
        return label
    }()
    private let statusDataLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.textColor = ColorConstants.baseWhite
        return label
    }()
    private let ownerTitleLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.textColor = ColorConstants.baseBlack
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.text = "Owner"
        return label
    }()
    private let ownerDataLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.textColor = ColorConstants.baseWhite
        return label
    }()
    private let locationTitleLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.textColor = ColorConstants.baseBlack
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.text = "Location"
        return label
    }()
    private let transferDateTitleLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.textColor = ColorConstants.baseBlack
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.text = "Transfer date"
        return label
    }()
    private let transferDateDataLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.textColor = ColorConstants.baseWhite
        return label
    }()
    private let divider1: UIView = {
        let divider = UIView()
        divider.activateConstraints()
        divider.backgroundColor = ColorConstants.baseWhite
        return divider
    }()
    private let divider2: UIView = {
        let divider = UIView()
        divider.activateConstraints()
        divider.backgroundColor = ColorConstants.baseWhite
        return divider
    }()
    private let divider3: UIView = {
        let divider = UIView()
        divider.activateConstraints()
        divider.backgroundColor = ColorConstants.baseWhite
        return divider
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
    
    func setStatusData(data: String) {
        statusDataLabel.text = data
    }
    func setOwnerData(data: String) {
        ownerDataLabel.text = data
    }
    func setTransferDateData(data: String) {
        transferDateDataLabel.text = data
    }
    
    // MARK: - Private functions
    
    private func addViews() {
        
        addSubview(backgroundView)
        addSubview(statusTitleLabel)
        addSubview(statusDataLabel)
        addSubview(divider1)
        addSubview(ownerTitleLabel)
        addSubview(ownerDataLabel)
        addSubview(divider2)
        addSubview(locationTitleLabel)
        addSubview(locationButton)
        addSubview(divider3)
        addSubview(transferDateTitleLabel)
        addSubview(transferDateDataLabel)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            statusTitleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            statusTitleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            
            statusDataLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            statusDataLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            
            divider1.topAnchor.constraint(equalTo: statusTitleLabel.bottomAnchor, constant: 10),
            divider1.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            divider1.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            divider1.heightAnchor.constraint(equalToConstant: 1),
            
            ownerTitleLabel.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: 10),
            ownerTitleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            
            ownerDataLabel.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: 10),
            ownerDataLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            
            divider2.topAnchor.constraint(equalTo: ownerTitleLabel.bottomAnchor, constant: 10),
            divider2.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            divider2.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            divider2.heightAnchor.constraint(equalToConstant: 1),
            
            locationTitleLabel.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: 10),
            locationTitleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            
            locationButton.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: 10),
            locationButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            locationButton.bottomAnchor.constraint(equalTo: locationTitleLabel.bottomAnchor),
            locationButton.heightAnchor.constraint(equalToConstant: 20),
            locationButton.widthAnchor.constraint(equalToConstant: 34),
            
            divider3.topAnchor.constraint(equalTo: locationTitleLabel.bottomAnchor, constant: 10),
            divider3.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            divider3.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            divider3.heightAnchor.constraint(equalToConstant: 1),
            
            transferDateTitleLabel.topAnchor.constraint(equalTo: divider3.bottomAnchor, constant: 10),
            transferDateTitleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            
            transferDateDataLabel.topAnchor.constraint(equalTo: divider3.bottomAnchor, constant: 10),
            transferDateDataLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            transferDateDataLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -10)
        ])
    }
    
    private func configureViews() {
        
        backgroundColor = ColorConstants.baseWhite
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.masksToBounds = true
    }
}
