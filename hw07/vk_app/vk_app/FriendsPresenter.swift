//
//  Presenter.swift
//  vk_app
//
//  Created by Dmitry An on 15/12/2023.
//

import Foundation

protocol PresenterProtocol {
    func setViewController(viewController: ViewControllerProtocol)
    
    func sendErrorNotification(date: String)
    
    func updateViewControllerData(data: [FriendsDataModel.Response.Friend])
    
    func askViewControllerStopRefreshing()
}

final class FriendsPresenter: PresenterProtocol {
    
    private weak var viewController: ViewControllerProtocol?
    
    func setViewController(viewController: ViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func sendErrorNotification(date: String) {
        guard let viewController = viewController else {
            print("Error while asking ViewController to show notification. ViewController was not loaded.")
            return
        }
        viewController.showAlert(date: date)
        askViewControllerStopRefreshing()
    }
    
    func updateViewControllerData(data: [FriendsDataModel.Response.Friend]) {
        guard let viewController = viewController else {
            print("Error while updating data in ViewController. ViewController was not loaded.")
            return
        }
        viewController.loadDataFromPresenter(data: data)
        askViewControllerStopRefreshing()
    }
    
    func askViewControllerStopRefreshing() {
        guard let viewController = viewController else {
            print("Error while asking ViewController to stop refreshing. ViewController was not loaded.")
            return
        }
        viewController.endRefreshing()
    }
    
}
