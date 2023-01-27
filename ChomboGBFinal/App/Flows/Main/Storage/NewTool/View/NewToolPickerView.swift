//
//  NewToolPickerView.swift
//  ChomboGBFinal
//
//  Created by admin on 27.01.2023.
//

import UIKit

class NewToolPickerView: UIView {
    
    // MARK: - Private properties
    
    private let picturePickerButton = UIButton()
    private let pickerLabel = UILabel()
    private let dataLabel = UILabel()
    
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
        
        picturePickerButton.translatesAutoresizingMaskIntoConstraints = false
        picturePickerButton.addTarget(self, action: #selector(setPhoto), for: .touchUpInside)
        
        pickerLabel.translatesAutoresizingMaskIntoConstraints = false
        pickerLabel.textColor = ColorConstants.baseBlack
        pickerLabel.font = UIFont(name: "Helvetica-Bold", size: 16)
        pickerLabel.numberOfLines = 1
        pickerLabel.minimumScaleFactor = 0.5
        pickerLabel.adjustsFontSizeToFitWidth = true
        pickerLabel.text = pickerLabelText
        
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        dataLabel.textColor = ColorConstants.darkYellow
        dataLabel.font = UIFont(name: "Helvetica-Bold", size: 16)
        dataLabel.numberOfLines = 1
        dataLabel.minimumScaleFactor = 0.5
        dataLabel.adjustsFontSizeToFitWidth = true
        dataLabel.text = setDataLabelText()
    }
    
    @objc private func setPhoto() {
        picturePickerButton.setImage(UIImage(named: "test_pic_730x520px"), for: .normal)
    }
}
