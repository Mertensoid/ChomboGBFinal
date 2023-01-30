//
//  CatalogTableViewCell.swift
//  ChomboGBFinal
//
//  Created by admin on 27.01.2023.
//

import UIKit

final class CatalogTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private let mainCellView = UIView()
    private let image = UIImageView(frame: CGRect(x: 10, y: 10, width: 105, height: 105))
    private let productNameTitle = UILabel()
    private let mainPropertyTitle = UILabel()
    private let secondaryPropertyTitle = UILabel()
    
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
    
    func configureData(name: String, picture: String, mainProperty: String, secondaryProperty: String) {
        productNameTitle.text = name
        image.image = UIImage(systemName: picture)
        mainPropertyTitle.text = mainProperty
        secondaryPropertyTitle.text = secondaryProperty
    }
    
    // MARK: - Private functions
    
    private func addViews() {

        addSubview(mainCellView)
        mainCellView.addSubview(image)
        mainCellView.addSubview(productNameTitle)
        mainCellView.addSubview(mainPropertyTitle)
        mainCellView.addSubview(secondaryPropertyTitle)
    }
    
    private func configureConstraints() {

        NSLayoutConstraint.activate([
            mainCellView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            mainCellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            mainCellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            mainCellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            image.leadingAnchor.constraint(equalTo: mainCellView.leadingAnchor, constant: 5),
            image.topAnchor.constraint(equalTo: mainCellView.topAnchor, constant: 5),
            image.heightAnchor.constraint(equalToConstant: 100),
            image.widthAnchor.constraint(equalToConstant: 100),
            
            productNameTitle.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            productNameTitle.topAnchor.constraint(equalTo: mainCellView.topAnchor, constant: 10),
            
            mainPropertyTitle.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            mainPropertyTitle.topAnchor.constraint(equalTo: productNameTitle.bottomAnchor, constant: 5),
            
            secondaryPropertyTitle.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            secondaryPropertyTitle.topAnchor.constraint(equalTo: mainPropertyTitle.bottomAnchor, constant: 5)
        ])
    }
    
    private func configureViews() {
        
        mainCellView.translatesAutoresizingMaskIntoConstraints = false
        mainCellView.backgroundColor = ColorConstants.baseWhite

        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = ColorConstants.baseBlack
        
        productNameTitle.translatesAutoresizingMaskIntoConstraints = false
        productNameTitle.font = UIFont(name: "Helvetica-Bold", size: 16)
        
        mainPropertyTitle.translatesAutoresizingMaskIntoConstraints = false
        mainPropertyTitle.font = UIFont(name: "Helvetica", size: 16)
        
        secondaryPropertyTitle.translatesAutoresizingMaskIntoConstraints = false
        secondaryPropertyTitle.font = UIFont(name: "Helvetica", size: 16)
    }
}

