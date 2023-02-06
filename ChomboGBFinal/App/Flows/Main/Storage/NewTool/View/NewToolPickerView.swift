//
//  NewToolPickerView.swift
//  ChomboGBFinal
//
//  Created by admin on 27.01.2023.
//

import UIKit

class NewToolPickerView: UIView {
    
    // MARK: - Private properties
    
    private let picturePickerButton: UIButton = {
        let picturePickerButton = UIButton()
        picturePickerButton.activateConstraints()
        return picturePickerButton
    }()
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
    
    func setDataLabelText() -> String {
        return "Some Data >"
    }
    
    // MARK: - Private functions
    
    private func addViews() {
        
        addSubview(picturePickerButton)
        addSubview(pickerLabel)
        addSubview(dataLabel)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            
            picturePickerButton.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            picturePickerButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            picturePickerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            picturePickerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
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
        
        picturePickerButton.addTarget(self, action: #selector(setPhoto), for: .touchUpInside)
        
        pickerLabel.text = pickerLabelText
        
        dataLabel.text = setDataLabelText()
    }
    
    @objc private func setPhoto() {
        
    }
}
