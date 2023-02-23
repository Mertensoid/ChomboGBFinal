//
//  ToolsListViewController.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

final class ToolsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Propeties
    
    var presenter: ToolsListViewOutputDelegate?
    
    // MARK: - Private properties
    
    private let headerView: ToolsListHeaderView = {
        let headerView = ToolsListHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        headerView.activateConstraints()
        return headerView
    }()
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.activateConstraints()
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        addViews()
        configureConstraints()
        configureViews()
    }
    
    // MARK: - Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getToolsQuantity() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ToolsListTableViewCell()
        cell.configureData(
            name: presenter?.getToolName(toolIndex: indexPath.row) ?? "",
//            picture: presenter?.getToolImage(toolIndex: indexPath.row) ?? UIImage(),
            category: presenter?.getToolCategory(toolIndex: indexPath.row) ?? "",
            toolSerial: presenter?.getToolSerial(toolIndex: indexPath.row) ?? "",
            condition: presenter?.getToolCondition(toolIndex: indexPath.row) ?? ""
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailsScreen()
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
        tableView.separatorStyle = .none
        headerView.leftHeaderButton.addTarget(self, action: #selector(logoutButtonPressed), for: .touchUpInside)
    }
    
    @objc func logoutButtonPressed() {
        self.dismiss(animated: true)
    }
}

extension ToolsListViewController: ToolsListViewInputDelegate {
    func tableViewReloadData() {
        self.tableView.reloadData()
    }
}
