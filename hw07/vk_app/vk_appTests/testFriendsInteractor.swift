//
//  testFriendsInteractor.swift
//  vk_appTests
//
//  Created by Dmitry An on 16/12/2023.
//

import XCTest

@testable import vk_app

final class testFriendsInteractor: XCTestCase {

    private var interactor: FriendsInteractor!
    private var presenter: PresenterSpy!
    private var fileCache: FileCacheMock!
    private var networkService: NetworkServiceMock!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.presenter = PresenterSpy()
        self.fileCache = FileCacheMock()
        self.networkService = NetworkServiceMock()
        self.interactor = FriendsInteractor(presenter: presenter, fileCache: FileCacheMock(), networkService: NetworkServiceMock())
    }

    override func tearDownWithError() throws {
        self.interactor = nil
        self.presenter = nil
        self.fileCache = nil
    }
    
    func testfirstLoadConfigure() {
        interactor.firstLoadConfigure()
        XCTAssertTrue(presenter.wasUpdateViewControllerDataCalled)
        XCTAssertEqual(presenter.data, [fileCache.sampleFriend1,fileCache.sampleFriend2])
    }
    
    func testTellPresenterAboutErrorWhileFetchingTheData() {
        interactor.tellPresenterAboutErrorWhileFetchingTheData()
        XCTAssertTrue(presenter.wasSendErrorNotificationCalled)
        XCTAssertEqual("2023", presenter.dateString)
    }
    
    func testTellPresenterTheDataWasUpdated() {
        interactor.tellPresenterTheDataWasUpdated()
        XCTAssertTrue(presenter.wasUpdateViewControllerDataCalled)
    }
    
    func testuUpdateDataSuccess() {
        networkService.success = true
        interactor.updateData()
        // MARK: the function works with escaping closure, so we have to wait to get the result
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(self.networkService.wasGetDataCalled)
            XCTAssertTrue(self.presenter.wasUpdateViewControllerDataCalled)
            // MARK: we are comparing the dummy response from the network to the data given to FileCacheMock
            XCTAssertEqual(self.networkService.result.response.items, self.fileCache.dummySavedFriends)
        }
    }
    
    func testuUpdateDataNetworkError() {
        networkService.success = false
        interactor.updateData()
        // MARK: the function works with escaping closure, so we have to wait to get the result
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(self.networkService.wasGetDataCalled)
            XCTAssertTrue(self.presenter.wasSendErrorNotificationCalled)
            // MARK: we check how it gets the date of the last update from FileCacheMock and transfers it to Presenter
            XCTAssertEqual("2023", self.presenter.dateString)
        }
    }
}
