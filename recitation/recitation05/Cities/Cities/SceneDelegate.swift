//
//  SceneDelegate.swift
//  Cities
//
//  Created by Dmitry An on 15/11/2023.
//



import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    
// Создать новый проект, удалить в нем  сториборды и все их упоминания.
// В SceneDelegate  в качестве rootViewController назначить UINavigationController, а для UINavigationController назначить rootViewController ViewController.
// Назначить ViewController белый цвет фона. Проект должен запускаться. После запуска должны увидеть следующее:

    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let myWindowScene = (scene as? UIWindowScene) else { return }

        let viewController = UINavigationController(rootViewController: ViewController())
       
        window = UIWindow(windowScene: myWindowScene)
        window?.rootViewController = viewController // optional? chaining
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

