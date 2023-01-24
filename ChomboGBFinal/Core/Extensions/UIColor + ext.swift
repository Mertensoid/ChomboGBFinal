//
//  UIColor + ext.swift
//  ChomboGBFinal
//
//  Created by admin on 24.01.2023.
//

import UIKit

extension UIColor {
    
    convenience init(hexString: String) {
        
        var colorString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue: UInt64 = 0
        
        if (colorString.hasPrefix("#")) {
            colorString.remove(at: colorString.startIndex)
        }
        
        if ((colorString.count) != 6) {
            self.init(
                red: CGFloat(255.0),
                green: CGFloat(255.0),
                blue: CGFloat(255.0),
                alpha: CGFloat(1.0)
            )
        }
        
        Scanner(string: colorString).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    convenience init(hexString: String, alpha: Double) {

        var colorString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue: UInt64 = 0
        var colorAlpha: Double = alpha
        
        if colorAlpha > 1.0 {
            colorAlpha = 1.0
        }
        
        if (colorString.hasPrefix("#")) {
            colorString.remove(at: colorString.startIndex)
        }
        
        if ((colorString.count) != 6) {
            self.init(
                red: CGFloat(255.0),
                green: CGFloat(255.0),
                blue: CGFloat(255.0),
                alpha: CGFloat(colorAlpha)
            )
        }
        
        Scanner(string: colorString).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(colorAlpha)
        )
    }
}
