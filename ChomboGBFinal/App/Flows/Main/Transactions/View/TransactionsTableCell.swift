//
//  TransactionsTableCell.swift
//  ChomboGBFinal
//
//  Created by admin on 27.02.2023.
//

import UIKit

final class TransactionsTableCell: UITableViewCell {
    
    
    // MARK: - Private properties
    
    private let mainCellView: UIView = {
        let view = UIView()
        view.activateConstraints()
        view.backgroundColor = ColorConstants.backgroundGray
        view.layer.cornerRadius = 10
        view.layer.borderColor = ColorConstants.borderGray.cgColor
        view.layer.borderWidth = 1
        view.layer.masksToBounds = true
        return view
    }()
    private let image: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 10, y: 10, width: 105, height: 105))
        image.activateConstraints()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
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
    private let storageImage: UIImageView = {
        let image = UIImageView()
        image.activateConstraints()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.tintColor = ColorConstants.darkYellow
        image.image = UIImage(systemName: TabBarIcons.storage)
        return image
    }()
    private let arrowImage: UIImageView = {
        let image = UIImageView()
        image.activateConstraints()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    private let ownerImage: UIImageView = {
        let image = UIImageView()
        image.activateConstraints()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.tintColor = ColorConstants.darkYellow
        image.image = UIImage(systemName: TabBarIcons.profile)
        return image
    }()
    private let toolOwnerTitle: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "Helvetica", size: 16)
        label.textColor = ColorConstants.baseBlack
        return label
    }()
    private let acceptButton: UIButton = {
        let button = UIButton()
        button.activateConstraints()
        button.setTitle("Accept", for: .normal)
        button.backgroundColor = ColorConstants.buttonGreen
        button.layer.cornerRadius = 15
        button.setOpacity()
        button.makeTapWithButtonShadow()
        return button
    }()
    private let declineButton: UIButton = {
        let button = UIButton()
        button.activateConstraints()
        button.activateConstraints()
        button.setTitle("Decline", for: .normal)
        button.backgroundColor = ColorConstants.buttonRed
        button.layer.cornerRadius = 15
        button.setOpacity()
        button.makeTapWithButtonShadow()
        return button
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
    
    func configureData(toolName: String, toolImage: UIImage, arrowColor: UIColor, owner: String) {
        toolNameTitle.text = toolName
        image.image = toolImage
        toolOwnerTitle.text = owner
        arrowImage.tintColor = arrowColor
        arrowImage.image = UIImage(systemName: "arrowtriangle.right.fill") //"arrowtriangle.backward.fill"
    }
    
    // MARK: - Private functions
    
    private func addViews() {

        addSubview(mainCellView)
        mainCellView.addSubview(image)
        mainCellView.addSubview(toolNameTitle)
        mainCellView.addSubview(divider)
        mainCellView.addSubview(toolOwnerTitle)
        mainCellView.addSubview(storageImage)
        mainCellView.addSubview(arrowImage)
        mainCellView.addSubview(ownerImage)
        mainCellView.addSubview(acceptButton)
        mainCellView.addSubview(declineButton)
    }
    
    private func configureConstraints() {

        NSLayoutConstraint.activate([
            mainCellView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            mainCellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            mainCellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainCellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            image.leadingAnchor.constraint(equalTo: mainCellView.leadingAnchor, constant: 10),
            image.topAnchor.constraint(equalTo: mainCellView.topAnchor, constant: 10),
            image.heightAnchor.constraint(equalToConstant: 75),
            image.widthAnchor.constraint(equalToConstant: 75),
            
            toolNameTitle.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            toolNameTitle.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -10),
            toolNameTitle.topAnchor.constraint(equalTo: mainCellView.topAnchor, constant: 10),
            
            divider.topAnchor.constraint(equalTo: toolNameTitle.bottomAnchor, constant: 5),
            divider.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            divider.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -10),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            storageImage.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 5),
            storageImage.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            storageImage.heightAnchor.constraint(equalToConstant: 40),
            storageImage.widthAnchor.constraint(equalToConstant: 40),
            
            arrowImage.centerYAnchor.constraint(equalTo: storageImage.centerYAnchor),
            arrowImage.leadingAnchor.constraint(equalTo: storageImage.trailingAnchor, constant: 5),
            arrowImage.heightAnchor.constraint(equalToConstant: 20),
            arrowImage.widthAnchor.constraint(equalToConstant: 20),
            
            ownerImage.centerYAnchor.constraint(equalTo: storageImage.centerYAnchor),
            ownerImage.leadingAnchor.constraint(equalTo: arrowImage.trailingAnchor, constant: 5),
            ownerImage.heightAnchor.constraint(equalToConstant: 40),
            ownerImage.widthAnchor.constraint(equalToConstant: 40),
            
            toolOwnerTitle.centerYAnchor.constraint(equalTo: storageImage.centerYAnchor),
            toolOwnerTitle.leadingAnchor.constraint(equalTo: ownerImage.trailingAnchor, constant: 5),
            toolOwnerTitle.trailingAnchor.constraint(equalTo: mainCellView.trailingAnchor, constant: -10),
            
            acceptButton.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            acceptButton.leadingAnchor.constraint(equalTo: mainCellView.leadingAnchor, constant: 10),
            acceptButton.heightAnchor.constraint(equalToConstant: 30),
            acceptButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 25),
            acceptButton.bottomAnchor.constraint(equalTo: mainCellView.bottomAnchor, constant: -10),
            
            declineButton.centerYAnchor.constraint(equalTo: acceptButton.centerYAnchor),
            declineButton.leadingAnchor.constraint(equalTo: acceptButton.trailingAnchor, constant: 10),
            declineButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 25),
            declineButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func configureViews() {
        selectionStyle = .none
    }
}
