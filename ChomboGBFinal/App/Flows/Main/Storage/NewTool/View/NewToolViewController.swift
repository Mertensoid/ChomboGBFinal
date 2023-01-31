//
//  NewToolViewController.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

final class NewToolViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let headerView: NewToolHeaderView = {
        let headerView = NewToolHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        headerView.activateConstraints()
        return headerView
    }()
    private let pictureView: NewToolPictureView = {
        let pictureView = NewToolPictureView()
        pictureView.activateConstraints()
        return pictureView
    }()
    private let categoryPickerView: NewToolPickerView = {
        let categoryPickerView = NewToolPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), pickerLabelText: "Category")
        categoryPickerView.activateConstraints()
        return categoryPickerView
    }()
    private let brandTextView: NewToolTextView = {
        let brandTextView = NewToolTextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), textLabelText: "Brand")
        brandTextView.activateConstraints()
        return brandTextView
    }()
    private let modelTextView: NewToolTextView = {
        let modelTextView = NewToolTextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), textLabelText: "Model")
        modelTextView.activateConstraints()
        return modelTextView
    }()
    private let serialTextView: NewToolTextView = {
        let serialTextView = NewToolTextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), textLabelText: "Serial")
        serialTextView.activateConstraints()
        return serialTextView
    }()
    private let datePickerView: NewToolPickerView = {
        let datePickerView = NewToolPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), pickerLabelText: "Date")
        datePickerView.activateConstraints()
        return datePickerView
    }()
    private let conditionPickerView: NewToolPickerView = {
        let conditionPickerView = NewToolPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), pickerLabelText: "Condition")
        conditionPickerView.activateConstraints()
        return conditionPickerView
    }()
    private let addButton: UIButton = {
        let addButton = UIButton()
        addButton.activateConstraints()
        addButton.setTitle("Add", for: .normal)
        addButton.backgroundColor = ColorConstants.darkYellow
        addButton.layer.cornerRadius = 25
        addButton.setOpacity()
        addButton.makeTapWithButtonShadow()
        return addButton
    }()
    private let presenter = NewToolPresenter()
    weak private var viewOutputDelegate: NewToolViewOutputDelegate? 
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addViews()
        configureConstraints()
        configureViews()
        
        presenter.setViewInputDelegate(viewInputDelegate: self)
        self.viewOutputDelegate = presenter
    }
    
    // MARK: - Private functions
    
    private func addViews() {
        view.addSubview(headerView)
        view.addSubview(pictureView)
        view.addSubview(categoryPickerView)
        view.addSubview(brandTextView)
        view.addSubview(modelTextView)
        view.addSubview(serialTextView)
        view.addSubview(datePickerView)
        view.addSubview(conditionPickerView)
        view.addSubview(addButton)
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
            pictureView.heightAnchor.constraint(equalToConstant: 165),
            
            categoryPickerView.topAnchor.constraint(equalTo: pictureView.bottomAnchor, constant: 10),
            categoryPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            categoryPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            categoryPickerView.heightAnchor.constraint(equalToConstant: 50),
            
            brandTextView.topAnchor.constraint(equalTo: categoryPickerView.bottomAnchor, constant: 10),
            brandTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            brandTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            brandTextView.heightAnchor.constraint(equalToConstant: 70),
            
            modelTextView.topAnchor.constraint(equalTo: brandTextView.bottomAnchor, constant: 10),
            modelTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            modelTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            modelTextView.heightAnchor.constraint(equalToConstant: 70),
            
            serialTextView.topAnchor.constraint(equalTo: modelTextView.bottomAnchor, constant: 10),
            serialTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            serialTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            serialTextView.heightAnchor.constraint(equalToConstant: 70),
            
            datePickerView.topAnchor.constraint(equalTo: serialTextView.bottomAnchor, constant: 10),
            datePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            datePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            datePickerView.heightAnchor.constraint(equalToConstant: 50),
            
            conditionPickerView.topAnchor.constraint(equalTo: datePickerView.bottomAnchor, constant: 10),
            conditionPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            conditionPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            conditionPickerView.heightAnchor.constraint(equalToConstant: 50),
            
            addButton.topAnchor.constraint(equalTo: conditionPickerView.bottomAnchor, constant: 10),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            addButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func configureViews() {

        view.backgroundColor = ColorConstants.baseWhite
        
        headerView.leftHeaderButton.addTarget(self, action: #selector(goToCatalogScreen), for: .touchUpInside)

        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
    }
    
    @objc private func goToCatalogScreen() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func addButtonPressed() {
        
    }
}

extension NewToolViewController: NewToolViewInputDelegate {
    
    func setupInitialState() {
        
    }
    
    func setupData(with mockData: ([MockTool])) {
        
    }
    
    func displayData(index: Int) {
        
    }
    
    
}
