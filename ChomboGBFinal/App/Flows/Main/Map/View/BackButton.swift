//
//  BackButton.swift
//  ChomboGBFinal
//
//  Created by Stanislav on 13.02.2023.
//

import UIKit

class BackButton: UIViewController {
    
    let backButton: UIButton = {
        let button = UIButton (frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        button.backgroundColor = .systemGray
        
        let image = UIImage(systemName: "chevron.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 27, weight: .medium))
        
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    override func viewDidLayoutSubviews () {
        super.viewDidLayoutSubviews ()
        backButton.frame = CGRect (
            x: view.frame.size.width - 360 - 8,
            y: view.frame.size.height - 760 - 8,
            width: 50,
            height: 50)
    }
}
