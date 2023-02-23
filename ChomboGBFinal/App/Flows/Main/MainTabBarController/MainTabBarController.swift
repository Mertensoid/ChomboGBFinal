//
//  MainTabBarController.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Private functions
    
    //перенести в builder?
    private func configure() {
        
        tabBar.tintColor = ColorConstants.darkYellow
        tabBar.backgroundColor = ColorConstants.backgroundGray
        tabBar.layer.borderColor = ColorConstants.borderGray.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let profileController = ProfileBuilder.createProfileScreen()
        let toolsController = ToolsListBuilder.createToolsListScreen()
        let storageController = CatalogBuilder.createCatalogScreen()
        let transactionsController = TransactionsViewController()
        
        let profileNavigationController = UINavigationController(rootViewController: profileController)
        profileNavigationController.navigationBar.isHidden = true
        let toolsNavigationController = UINavigationController(rootViewController: toolsController)
        toolsNavigationController.navigationBar.isHidden = true
        let storageNavigationController = UINavigationController(rootViewController: storageController)
        storageNavigationController.navigationBar.isHidden = true
        let transactionsNavigationController = UINavigationController(rootViewController: transactionsController)
        transactionsNavigationController.navigationBar.isHidden = true
        
        profileController.tabBarItem = UITabBarItem(
            title: TabBarLabels.profile.rawValue,
            image: UIImage(systemName: TabBarIcons.profile),
            tag: Tabs.profile.rawValue)
        toolsController.tabBarItem = UITabBarItem(
            title: TabBarLabels.tools.rawValue,
            image: UIImage(systemName: TabBarIcons.tools),
            tag: Tabs.tools.rawValue)
        storageController.tabBarItem = UITabBarItem(
            title: TabBarLabels.storage.rawValue,
            image: UIImage(systemName: TabBarIcons.storage),
            tag: Tabs.storage.rawValue)
        transactionsController.tabBarItem = UITabBarItem(
            title: TabBarLabels.transactions.rawValue,
            image: UIImage(systemName: TabBarIcons.transactions),
            tag: Tabs.storage.rawValue)
        
        setViewControllers([
            profileNavigationController,
            toolsNavigationController,
            storageNavigationController,
            transactionsNavigationController
        ], animated: false)
    }
}
