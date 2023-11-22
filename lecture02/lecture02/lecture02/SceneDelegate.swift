//
//  SceneDelegate.swift
//  lecture02
//
//  Created by Dmitry An on 19/11/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let myWindowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: myWindowScene)
        let viewController = UINavigationController(rootViewController: ViewController())
    //    viewController.navigationBar.prefersLargeTitles
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}
