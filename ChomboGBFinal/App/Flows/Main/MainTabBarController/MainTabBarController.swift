//
//  MainTabBarController.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

enum Tabs: Int {
    case profile
    case tools
    case storage
    case transactions
}

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
        tabBar.backgroundColor = ColorConstants.baseWhite
        tabBar.layer.borderColor = ColorConstants.borderGray.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let profileController = UIViewController()
        let toolsController = UIViewController()
        let storageController = UIViewController()
        let transactionsController = UIViewController()
        
        let profileNavigationController = UINavigationController(rootViewController: profileController)
        profileNavigationController.navigationBar.isHidden = true
        let toolsNavigationController = UINavigationController(rootViewController: toolsController)
        toolsNavigationController.navigationBar.isHidden = true
        let storageNavigationController = UINavigationController(rootViewController: storageController)
        storageNavigationController.navigationBar.isHidden = true
        let transactionsNavigationController = UINavigationController(rootViewController: transactionsController)
        transactionsNavigationController.navigationBar.isHidden = true
        
        profileController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.circle"),
            tag: Tabs.profile.rawValue)
        toolsController.tabBarItem = UITabBarItem(
            title: "Tools",
            image: UIImage(systemName: "hammer.circle"),
            tag: Tabs.tools.rawValue)
        storageController.tabBarItem = UITabBarItem(
            title: "Storage",
            image: UIImage(systemName: "tray.circle"),
            tag: Tabs.storage.rawValue)
        transactionsController.tabBarItem = UITabBarItem(
            title: "Transactions",
            image: UIImage(systemName: "doc.circle"),
            tag: Tabs.storage.rawValue)
        
        setViewControllers([
            profileNavigationController,
            toolsNavigationController,
            storageNavigationController,
            transactionsNavigationController
        ], animated: false)
    }
}
