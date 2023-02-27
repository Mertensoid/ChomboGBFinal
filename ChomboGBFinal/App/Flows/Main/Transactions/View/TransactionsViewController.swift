//
//  TransactionsViewController.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

final class TransactionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    
    var presenter: TransactionsViewOutputDelegate?
    
    // MARK: - Private properties
    
    private let headerView: TransactionsHeaderView = {
        let view = TransactionsHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        view.activateConstraints()
        return view
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
        return 10//presenter?.getTransactionsQuantity() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TransactionsTableCell()

        cell.configureData(
            toolName: "Название",
            toolImage: UIImage(named: "123") ?? UIImage(),
            arrowColor: ColorConstants.buttonGreen,
            owner: "Получатель"
        )
//        cell.configureData(
//            name: presenter?.getToolName(toolIndex: indexPath.row) ?? "",
//            picture: presenter?.getToolImage(toolIndex: indexPath.row) ?? UIImage(),
//            category: presenter?.getToolCategory(toolIndex: indexPath.row) ?? "",
//            toolSerial: presenter?.getToolSerial(toolIndex: indexPath.row) ?? "",
//            color: presenter?.getIndicatorColor(toolIndex: indexPath.row) ?? ColorConstants.lightYellow,
//            owner: presenter?.getToolOwner(toolIndex: indexPath.row) ?? ""
//        )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetails()
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
}

@objc extension TransactionsViewController {
    func logoutButtonPressed(_ sender: UIButton) {
        presenter?.logout()
    }
}

extension TransactionsViewController: TransactionsViewInputDelegate {
    func tableViewReloadData() {
        self.tableView.reloadData()
    }
}
