//
//  NewToolPickerView.swift
//  ChomboGBFinal
//
//  Created by admin on 27.01.2023.
//

import UIKit

class NewToolPickerView: UIView {
    
    // MARK: - Public properties
    
    let pickerButton: UIButton = {
        let pickerButton = UIButton()
        pickerButton.activateConstraints()
        return pickerButton
    }()
    
    // MARK: - Private properties
    
    private let pickerLabel: UILabel = {
        let pickerLabel = UILabel()
        pickerLabel.activateConstraints()
        pickerLabel.textColor = ColorConstants.baseBlack
        pickerLabel.font = UIFont(name: "Helvetica-Bold", size: 16)
        pickerLabel.numberOfLines = 1
        pickerLabel.minimumScaleFactor = 0.5
        pickerLabel.adjustsFontSizeToFitWidth = true
        return pickerLabel
    }()
    private let dataLabel: UILabel = {
        let dataLabel = UILabel()
        dataLabel.activateConstraints()
        dataLabel.textColor = ColorConstants.darkYellow
        dataLabel.font = UIFont(name: "Helvetica-Bold", size: 16)
        dataLabel.numberOfLines = 1
        dataLabel.minimumScaleFactor = 0.5
        dataLabel.adjustsFontSizeToFitWidth = true
        dataLabel.text = ">"
        return dataLabel
    }()
    
    // MARK: - Construction
    
    init(frame: CGRect, pickerLabelText: String) {
        super.init(frame: frame)
        
        addViews()
        configureConstraints()
        configureViews(pickerLabelText: pickerLabelText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    func getData() -> String {
        if let data = dataLabel.text {
            return data
        } else {
            return ""
        }
    }
    
    func setData(data: String) {
        dataLabel.text = data + " >"
    }
    
    // MARK: - Private functions
    
    private func addViews() {
        
        addSubview(pickerButton)
        addSubview(pickerLabel)
        addSubview(dataLabel)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            
            pickerButton.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            pickerButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            pickerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            pickerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            pickerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            pickerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            dataLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            dataLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func configureViews(pickerLabelText: String) {
        
        backgroundColor = ColorConstants.backgroundGray
        layer.cornerRadius = 10
        layer.borderColor = ColorConstants.borderGray.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
        
        pickerLabel.text = pickerLabelText
    }
}
