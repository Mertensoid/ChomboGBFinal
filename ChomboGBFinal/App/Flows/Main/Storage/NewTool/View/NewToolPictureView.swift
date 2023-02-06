//
//  NewToolPictureView.swift
//  ChomboGBFinal
//
//  Created by admin on 27.01.2023.
//

import UIKit

class NewToolPictureView: UIView {
    
    // MARK: - Private properties
    
    private let picturePickerButton: UIButton = {
        let picturePickerButton = UIButton()
        picturePickerButton.activateConstraints()
        picturePickerButton.tintColor = ColorConstants.baseBlack
        picturePickerButton.setImage(UIImage(systemName: "photo"), for: .normal)
        picturePickerButton.imageView?.contentMode = .scaleAspectFill
        return picturePickerButton
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
    
    // MARK: - Private functions
    
    private func addViews() {
        
        addSubview(picturePickerButton)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            
            picturePickerButton.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            picturePickerButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            picturePickerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            picturePickerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        ])
    }
    
    private func configureViews() {
        
        backgroundColor = ColorConstants.backgroundGray
        layer.cornerRadius = 10
        layer.borderColor = ColorConstants.borderGray.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
        
        picturePickerButton.addTarget(self, action: #selector(setPhoto), for: .touchUpInside)
    }
    
    @objc private func setPhoto() {
        picturePickerButton.setImage(UIImage(named: "test_pic_730x520px"), for: .normal)
    }
}
