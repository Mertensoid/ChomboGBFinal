//
//  NewToolViewController.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

final class NewToolViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let headerView = NewToolHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
    private let pictureView = NewToolPictureView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addViews()
        configureConstraints()
        configureViews()
    }
    
    // MARK: - Private functions
    
    private func addViews() {
        view.addSubview(headerView)
        view.addSubview(pictureView)
    }
    
    private func configureConstraints() {

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 100),
            
            pictureView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            pictureView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            pictureView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            pictureView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureViews() {

        view.backgroundColor = ColorConstants.baseWhite
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.leftHeaderButton.addTarget(self, action: #selector(goToCatalogScreen), for: .touchUpInside)
        
        pictureView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func goToCatalogScreen() {
        navigationController?.popViewController(animated: true)
    }
}
