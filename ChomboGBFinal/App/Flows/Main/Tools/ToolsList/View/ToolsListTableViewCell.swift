//
//  ToolsListTableViewCell.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

final class ToolsListTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private let mainCellView: UIView = {
        let view = UIView()
        view.activateConstraints()
        view.backgroundColor = ColorConstants.backgroundGray
        return view
    }()
    private let image: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 10, y: 10, width: 105, height: 105))
        image.activateConstraints()
        image.tintColor = ColorConstants.baseBlack
        return image
    }()
    private let toolNameTitle: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        label.textColor = ColorConstants.baseBlack
        return label
    }()
    private let divider: UIView = {
        let divider = UIView()
        divider.activateConstraints()
        divider.backgroundColor = ColorConstants.darkYellow
        return divider
    }()
    private let toolCategoryTitle: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "Helvetica", size: 16)
        label.textColor = ColorConstants.checkBoxTitleGray
        return label
    }()
    private let toolSerialTitle: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "Helvetica", size: 16)
        label.textColor = ColorConstants.checkBoxTitleGray
        return label
    }()
    private let toolConditionTitle: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "Helvetica", size: 16)
        label.textColor = ColorConstants.checkBoxTitleGray
        return label
    }()
    
    // MARK: - Construction
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        configureConstraints()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
//    func configureData(name: String, picture: UIImage, category: String, toolSerial: String, condition: String) {
    func configureData(name: String, category: String, toolSerial: String, condition: String) {
        toolNameTitle.text = name
//        image.image = picture
        toolCategoryTitle.text = category
        toolSerialTitle.text = toolSerial
        toolConditionTitle.text = condition
    }
    
    // MARK: - Private functions
    
    private func addViews() {

        addSubview(mainCellView)
        mainCellView.addSubview(image)
        mainCellView.addSubview(toolNameTitle)
        mainCellView.addSubview(divider)
        mainCellView.addSubview(toolCategoryTitle)
        mainCellView.addSubview(toolSerialTitle)
        mainCellView.addSubview(toolConditionTitle)
    }
    
    private func configureConstraints() {

        NSLayoutConstraint.activate([
            mainCellView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            mainCellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            mainCellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainCellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            image.leadingAnchor.constraint(equalTo: mainCellView.leadingAnchor, constant: 10),
            image.topAnchor.constraint(equalTo: mainCellView.topAnchor, constant: 10),
            image.heightAnchor.constraint(equalToConstant: 100),
            image.widthAnchor.constraint(equalToConstant: 100),
            image.bottomAnchor.constraint(lessThanOrEqualTo: mainCellView.bottomAnchor, constant: -10),
            
            toolNameTitle.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            toolNameTitle.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -10),
            toolNameTitle.topAnchor.constraint(equalTo: mainCellView.topAnchor, constant: 10),
            
            divider.topAnchor.constraint(equalTo: toolNameTitle.bottomAnchor, constant: 5),
            divider.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            divider.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -10),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            toolCategoryTitle.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            toolCategoryTitle.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -10),
            toolCategoryTitle.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 5),
            
            toolSerialTitle.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            toolSerialTitle.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -10),
            toolSerialTitle.topAnchor.constraint(equalTo: toolCategoryTitle.bottomAnchor, constant: 5),
            
            toolConditionTitle.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            toolConditionTitle.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -10),
            toolConditionTitle.topAnchor.constraint(equalTo: toolSerialTitle.bottomAnchor, constant: 5),
            toolConditionTitle.bottomAnchor.constraint(lessThanOrEqualTo: mainCellView.bottomAnchor, constant: -10)
        ])
    }
    
    private func configureViews() {
        selectionStyle = .none
        
        mainCellView.layer.cornerRadius = 10
        mainCellView.layer.borderColor = ColorConstants.borderGray.cgColor
        mainCellView.layer.borderWidth = 1
        mainCellView.layer.masksToBounds = true
    }
}

