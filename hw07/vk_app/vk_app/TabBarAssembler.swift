//
//  TestClass.swift
//  not_storyboard
//
//  Created by Dmitry An on 22/11/2023.
//

import UIKit

final class TabBarAssembler {
        
    static func run() -> UITabBarController {
        
        let fileCache = FileCache()
        let networkService = NetworkService()
        
        let presenter = FriendsPresenter()
        let interactor = FriendsInteractor(
            presenter: presenter,
            fileCache: fileCache,
            networkService: networkService
        )
        let friendsViewController = FriendsViewController(
            interactor: interactor
        )
        
        presenter.setViewController(viewController: friendsViewController)
        
        let controller1 = UINavigationController(
            rootViewController: friendsViewController
        )
        
        let controller2 = UINavigationController(
            rootViewController: GroupsViewController(
                networkService: networkService,
                fileCache: fileCache
            )
        )
        
        let controller3 = UINavigationController(
            rootViewController: PhotosViewController(
                networkService: networkService,
                collectionViewLayout: UICollectionViewFlowLayout()
            )
        )
        
        controller1.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person"), tag: 0)
        controller2.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(systemName: "person.3"), tag: 1)
        controller3.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "photo"), tag: 2)
        
        let controllers = [controller1, controller2, controller3]
        
        let myTabBarController = UITabBarController()
        myTabBarController.viewControllers = controllers
        myTabBarController.tabBar.backgroundColor = .systemGray6
        
        return myTabBarController
        
    }
}

#Preview {
    TabBarAssembler.run()
}
