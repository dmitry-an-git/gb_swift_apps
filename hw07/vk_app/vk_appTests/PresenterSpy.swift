//
//  PresenterSpy.swift
//  vk_appTests
//
//  Created by Dmitry An on 16/12/2023.
//

import Foundation

@testable import vk_app

final class PresenterSpy: PresenterProtocol {

    private(set) var wasSetViewControllerCalled = false
    private(set) var wasSendErrorNotificationCalled = false
    private(set) var wasUpdateViewControllerDataCalled = false
    private(set) var wasAskViewControllerStopRefreshingCalled = false
    private(set) var dateString = ""
    private(set) var data: [FriendsDataModel.Response.Friend] = []
    
    func setViewController(viewController: ViewControllerProtocol) {
    }
    
    func sendErrorNotification(date: String) {
        wasSendErrorNotificationCalled = true
        dateString = date
    }
    
    func updateViewControllerData(data: [FriendsDataModel.Response.Friend]) {
        wasUpdateViewControllerDataCalled = true
        self.data = data
    }
    
    func askViewControllerStopRefreshing() {
        wasAskViewControllerStopRefreshingCalled = true
    }
    
}
