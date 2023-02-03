//
//  ToolDetailsBasicInformationView.swift
//  ChomboGBFinal
//
//  Created by admin on 03.02.2023.
//

import UIKit

final class ToolDetailsBasicInformationView: UIView {
    
    // MARK: - Private properties

    private let backgroundView: UIView = {
        let view = UIView()
        view.activateConstraints()
        view.backgroundColor = ColorConstants.darkYellow
        return view
    }()
    private let categoryTitleLabel: UILabel = {
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
    private let categoryDataLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.textColor = ColorConstants.baseWhite
        return label
    }()
    private let brandTitleLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.textColor = ColorConstants.baseBlack
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.text = "Brand"
        return label
    }()
    private let brandDataLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.textColor = ColorConstants.baseWhite
        return label
    }()
    private let modelTitleLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.textColor = ColorConstants.baseBlack
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.text = "Model"
        return label
    }()
    private let modelDataLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.textColor = ColorConstants.baseWhite
        return label
    }()
    private let serialTitleLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.textColor = ColorConstants.baseBlack
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.text = "Serial"
        return label
    }()
    private let serialDataLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.textColor = ColorConstants.baseWhite
        return label
    }()
    private let productionDateTitleLabel: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.textColor = ColorConstants.baseBlack
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.text = "Production date"
        return label
    }()
    private let productionDateDataLabel: UILabel = {
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
    private let divider4: UIView = {
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
    
    func setCategoryData(data: String) {
        categoryDataLabel.text = data
    }
    func setBrandData(data: String) {
        brandDataLabel.text = data
    }
    func setModelData(data: String) {
        modelDataLabel.text = data
    }
    func setSerialData(data: String) {
        serialDataLabel.text = data
    }
    func setProductionDateData(data: String) {
        productionDateDataLabel.text = data
    }
    
    // MARK: - Private functions
    
    private func addViews() {
        
        addSubview(backgroundView)
        addSubview(categoryTitleLabel)
        addSubview(categoryDataLabel)
        addSubview(divider1)
        addSubview(brandTitleLabel)
        addSubview(brandDataLabel)
        addSubview(divider2)
        addSubview(modelTitleLabel)
        addSubview(modelDataLabel)
        addSubview(divider3)
        addSubview(serialTitleLabel)
        addSubview(serialDataLabel)
        addSubview(divider4)
        addSubview(productionDateTitleLabel)
        addSubview(productionDateDataLabel)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            categoryTitleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            categoryTitleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            
            categoryDataLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            categoryDataLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            
            divider1.topAnchor.constraint(equalTo: categoryTitleLabel.bottomAnchor, constant: 10),
            divider1.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            divider1.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            divider1.heightAnchor.constraint(equalToConstant: 1),
            
            brandTitleLabel.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: 10),
            brandTitleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            
            brandDataLabel.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: 10),
            brandDataLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            
            divider2.topAnchor.constraint(equalTo: brandTitleLabel.bottomAnchor, constant: 10),
            divider2.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            divider2.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            divider2.heightAnchor.constraint(equalToConstant: 1),
            
            modelTitleLabel.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: 10),
            modelTitleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            
            modelDataLabel.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: 10),
            modelDataLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            
            divider3.topAnchor.constraint(equalTo: modelTitleLabel.bottomAnchor, constant: 10),
            divider3.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            divider3.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            divider3.heightAnchor.constraint(equalToConstant: 1),
            
            serialTitleLabel.topAnchor.constraint(equalTo: divider3.bottomAnchor, constant: 10),
            serialTitleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            
            serialDataLabel.topAnchor.constraint(equalTo: divider3.bottomAnchor, constant: 10),
            serialDataLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            
            divider4.topAnchor.constraint(equalTo: serialTitleLabel.bottomAnchor, constant: 10),
            divider4.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            divider4.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            divider4.heightAnchor.constraint(equalToConstant: 1),
            
            productionDateTitleLabel.topAnchor.constraint(equalTo: divider4.bottomAnchor, constant: 10),
            productionDateTitleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            
            productionDateDataLabel.topAnchor.constraint(equalTo: divider4.bottomAnchor, constant: 10),
            productionDateDataLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            productionDateTitleLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -10)
        ])
    }
    
    private func configureViews() {
        
        backgroundColor = ColorConstants.baseWhite
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.masksToBounds = true
        
//        layer.cornerRadius = 10
//        layer.shadowColor = ColorConstants.opacityBlack.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 3)
//        layer.shadowOpacity = 1.0
//        layer.shadowRadius = 3.0
//        layer.masksToBounds = false
    }
}
