//
//  TabBarControllerDelegate.swift
//  not_storyboard
//
//  Created by Dmitry An on 22/11/2023.
//

import UIKit

final class TabBarControllerDelegate: UITabBarController, UITabBarControllerDelegate {
    
    // without this wrapping it does not show any titles!
    // probably it can be merged with TabBarFunc
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        title = "Friends" // otherwise it is somehow empty on the first screen
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.navigationItem.title = viewController.title
    }
}
