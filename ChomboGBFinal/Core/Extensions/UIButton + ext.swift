//
//  UIButton + ext.swift
//  ChomboGBFinal
//
//  Created by admin on 24.01.2023.
//

import UIKit

extension UIButton {
    
    func makeTapWithButtonShadow() {
        
        self.addTarget(
            self,
            action: #selector(handleIn),
            for: [
                .touchDown,
                .touchDragInside
            ]
        )
        
        self.addTarget(
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
    
    func setOpacity() {
        
        self.layer.shadowColor = ColorConstants.opacityBlack.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 3.0
        self.layer.masksToBounds = false
    }
    
    func removeOpacity() {
        
        self.layer.shadowColor = .none
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = .zero
        self.layer.shadowRadius = .zero
        self.layer.masksToBounds = true
    }
    
    @objc func handleIn() {
        
        UIView.animate(withDuration: 0.2) {
            self.removeOpacity()
        }
    }
    
    @objc func handleOut() {
        
        UIView.animate(withDuration: 0.2) {
            self.setOpacity()
        }
    }
}
