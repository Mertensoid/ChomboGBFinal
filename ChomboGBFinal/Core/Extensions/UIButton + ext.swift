//
//  UIButton + ext.swift
//  ChomboGBFinal
//
//  Created by admin on 24.01.2023.
//

import UIKit

extension UIButton {
    
    func makeTapWithButtonShadow(_ button: UIButton) {
        
        button.addTarget(
            self,
            action: #selector(handleIn),
            for: [
                .touchDown,
                .touchDragInside
            ]
        )
        
        button.addTarget(
            self,
            action: #selector(handleOut),
            for: [
                .touchUpInside,
                .touchUpOutside,
                .touchDragExit,
                .touchCancel,
                .touchDragOutside
            ]
        )
    }
    
    @objc func handleIn() {
        UIView.animate(withDuration: 0.1) {
            self.layer.shadowColor = ColorConstants.opacityBlack.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 3)
            self.layer.shadowOpacity = 1.0
            self.layer.shadowRadius = 3.0
            self.layer.masksToBounds = false
        }
    }
    
    @objc func handleOut() {
        UIView.animate(withDuration: 0.1) {
            self.layer.shadowColor = .none
            self.layer.shadowOffset = .zero
            self.layer.shadowOpacity = .zero
            self.layer.shadowRadius = .zero
            self.layer.masksToBounds = true
        }
    }
}
