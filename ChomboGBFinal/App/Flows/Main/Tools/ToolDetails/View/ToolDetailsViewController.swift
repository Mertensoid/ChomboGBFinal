//
//  ToolDetailsViewController.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

class ToolDetailsViewController: UIViewController {

    // MARK: - Public properties
    
    var presenter: ToolDetailsViewOutputDelegate?
    
    // MARK: - Private Properties
    
    private let headerView: ToolDetailsHeaderView = {
        let view = ToolDetailsHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        view.activateConstraints()
        return view
    }()
    private let photoView: ToolDetailsPhotoView = {
        let view = ToolDetailsPhotoView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        view.activateConstraints()
        return view
    }()
    private let receiveButton: UIButton = {
        let button = UIButton()
        button.activateConstraints()
        button.setTitle("Receive", for: .normal)
        button.backgroundColor = ColorConstants.buttonGreen
        button.layer.cornerRadius = 25
        button.setOpacity()
        button.makeTapWithButtonShadow()
        return button
    }()
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.activateConstraints()
        return scrollView
    }()
    private let basicInformationView: ToolDetailsBasicInformationView = {
        let view = ToolDetailsBasicInformationView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        view.activateConstraints()
        return view
    }()
    private let basicInformationSubtitle: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.backgroundColor = ColorConstants.baseWhite
        label.textColor = ColorConstants.checkBoxTitleGray
        label.numberOfLines = 0
        label.text = "The basic information about the tool is set when creating the card and can be changed by the system administrator"
        return label
    }()
    private let locationView: ToolDetailsLocationView = {
        let view = ToolDetailsLocationView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        view.activateConstraints()
        return view
    }()
    private let locationSubtitle: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.backgroundColor = ColorConstants.baseWhite
        label.textColor = ColorConstants.checkBoxTitleGray
        label.numberOfLines = 0
        label.text = "Information about the current location of the tool is updated after the actual movement"
        return label
    }()
    private let techInfoView: ToolDetailsTechInfoView = {
        let view = ToolDetailsTechInfoView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        view.activateConstraints()
        return view
    }()
    private let techInfoSubtitle: UILabel = {
        let label = UILabel()
        label.activateConstraints()
        label.backgroundColor = ColorConstants.baseWhite
        label.textColor = ColorConstants.checkBoxTitleGray
        label.numberOfLines = 0
        label.text = "Technical information is edited during the maintenance process by the system administrator"
        return label
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        configureConstraints()
        configureViews()
    }
    
    // MARK: - Public functions
    
    // MARK: - Private functions

    private func addViews() {
        
        view.addSubview(headerView)
        view.addSubview(photoView)
        view.addSubview(receiveButton)
        view.addSubview(scrollView)
        scrollView.addSubview(basicInformationView)
        scrollView.addSubview(basicInformationSubtitle)
        scrollView.addSubview(locationView)
        scrollView.addSubview(locationSubtitle)
        scrollView.addSubview(techInfoView)
        scrollView.addSubview(techInfoSubtitle)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 220),
            
            photoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            photoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            photoView.heightAnchor.constraint(equalToConstant: 150),
            photoView.widthAnchor.constraint(equalToConstant: 150),
            
            receiveButton.centerYAnchor.constraint(equalTo: headerView.bottomAnchor),
            receiveButton.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 10),
            receiveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            receiveButton.heightAnchor.constraint(equalToConstant: 50),
            
            scrollView.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            
            basicInformationView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            basicInformationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            basicInformationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            basicInformationSubtitle.topAnchor.constraint(equalTo: basicInformationView.bottomAnchor, constant: 10),
            basicInformationSubtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            basicInformationSubtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            locationView.topAnchor.constraint(equalTo: basicInformationSubtitle.bottomAnchor, constant: 10),
            locationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            locationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            locationSubtitle.topAnchor.constraint(equalTo: locationView.bottomAnchor, constant: 10),
            locationSubtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            locationSubtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            techInfoView.topAnchor.constraint(equalTo: locationSubtitle.bottomAnchor, constant: 10),
            techInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            techInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            techInfoSubtitle.topAnchor.constraint(equalTo: techInfoView.bottomAnchor, constant: 10),
            techInfoSubtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            techInfoSubtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            techInfoSubtitle.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
        ])
    }
    
    private func configureViews() {
        
        view.backgroundColor = ColorConstants.baseWhite
        photoView.setToolPhoto(image: UIImage(named: "magister_284x284px") ?? UIImage())
        
        basicInformationView.setCategoryData(data: "Mock category")
        basicInformationView.setBrandData(data: "Mock brand")
        basicInformationView.setModelData(data: "Mock model")
        basicInformationView.setSerialData(data: "Mock serial")
        basicInformationView.setProductionDateData(data: "DD.MM.YYYY")
        
        locationView.setStatusData(data: "Mock status")
        locationView.setOwnerData(data: "Mock owner")
        locationView.setTransferDateData(data: "DD.MM.YYYY")
        
        techInfoView.setConditionData(data: "Mock condition")
    }
}

extension ToolDetailsViewController: ToolDetailsViewInputDelegate {
    
}
