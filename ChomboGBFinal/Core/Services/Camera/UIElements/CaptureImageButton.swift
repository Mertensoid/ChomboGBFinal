//
//  CaptureImageButton.swift
//  ChomboGBFinal
//
//  Created by Stanislav on 20.02.2023.
//

import UIKit

final class CaptureImageButton: UIButton {

    override var intrinsicContentSize: CGSize {
        CGSize(width: 72, height: 72)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = intrinsicContentSize.height / 2
        layer.borderWidth = 4
        layer.borderColor = UIColor.systemGray.cgColor
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}