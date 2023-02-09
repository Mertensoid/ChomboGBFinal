//
//  ToolDetailsPhotoView.swift
//  ChomboGBFinal
//
//  Created by admin on 03.02.2023.
//

import UIKit

class ToolDetailsPhotoView: UIView {
    
    // MARK: - Private properties
    
    private let backGroundView: UIView = {
        let view = UIView()
        view.activateConstraints()
        view.backgroundColor = ColorConstants.baseWhite
        view.layer.cornerRadius = 8
        return view
    }()
    private let photoView: UIImageView = {
        let view = UIImageView()
        view.activateConstraints()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    // MARK: - Construction
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        addViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public functions
    
    func setToolPhoto(image: UIImage) {
        photoView.image = image
    }
    
    // MARK: - Private functions
    
    private func addViews() {
        
        addSubview(backGroundView)
        addSubview(photoView)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            
            backGroundView.topAnchor.constraint(equalTo: topAnchor),
            backGroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backGroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            photoView.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 4),
            photoView.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor, constant: -4),
            photoView.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 4),
            photoView.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -4)
        ])
    }
}
