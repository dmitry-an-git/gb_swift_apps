//
//  TestClass.swift
//  not_storyboard
//
//  Created by Dmitry An on 22/11/2023.
//

import UIKit

final class TabBarFunc {
        
    static func run() -> TabBarControllerDelegate {
        
        let controller1 = FirstTableViewController()
        let controller2 = SecondTableViewController()
        let controller3 = CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        controller1.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person"), tag: 0)
        controller2.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(systemName: "person.3"), tag: 1)
        controller3.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "photo"), tag: 2)
        
        let controllers = [controller1, controller2, controller3]
        
        let myTabBarController = TabBarControllerDelegate()
        myTabBarController.viewControllers = controllers
        myTabBarController.tabBar.backgroundColor = .systemGray6
        
        return myTabBarController
        
    }
}

#Preview {
    TabBarFunc.run()
}
