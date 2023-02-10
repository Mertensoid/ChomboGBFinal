//
//  CatalogViewController.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

final class CatalogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    
    weak var presenter: CatalogViewOutputDelegate?
    
    // MARK: - Private properties
    
    private let headerView: CatalogHeaderView = {
        let headerView = CatalogHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        headerView.activateConstraints()
        return headerView
    }()
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.activateConstraints()
        return tableView
    }()
    
    private let firestoreService = CloudFirestore()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        addViews()
        configureConstraints()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CatalogTableViewCell()
    
        cell.configureData(
            name: "Bosch Master",
            picture: UIImage(named: "123") ?? UIImage(),
            category: "Электроинструмент",
            toolSerial: "NJF155-767", 
            condition: "Working",
            status: "Free",
            owner: "Storage"
        )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toolDetailsVC = ToolDetailsViewController()
        navigationController?.pushViewController(toolDetailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // MARK: - Private functions
    
    private func addViews() {
        view.addSubview(headerView)
        view.addSubview(tableView)
    }
    
    private func configureConstraints() {

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 100),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func configureViews() {
        
        headerView.rightHeaderButton.addTarget(self, action: #selector(goToNewToolScreen(_:)), for: .touchUpInside)
    }
    
    @objc func goToNewToolScreen(_ sender: UIButton) {
        let newToolVC = NewToolBuilder.createNewToolScreen()
        navigationController?.pushViewController(newToolVC, animated: true)
    }
}

extension CatalogViewController: CatalogViewInputDelegate {
    
}
