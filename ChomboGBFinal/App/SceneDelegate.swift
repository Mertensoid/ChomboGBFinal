//
//  SceneDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 17.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = (scene as? UIWindowScene) else {
                return
            }
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = LoginViewController()
            self.window = window
            window.makeKeyAndVisible()
        }
}

