//
//  Interactor.swift
//  vk_app
//
//  Created by Dmitry An on 15/12/2023.
//

import Foundation

protocol InteractorProtocol {
    func tellPresenterAboutErrorWhileFetchingTheData()
    func tellPresenterTheDataWasUpdated()
    func updateData()
    func firstLoadConfigure()
}

final class FriendsInteractor: InteractorProtocol {
    
    private var networkService: NetworkServiceProtocol
    private(set) var fileCache: FileCacheProtocol
    private var presenter: PresenterProtocol
    
    init(presenter: PresenterProtocol, fileCache: FileCacheProtocol, networkService: NetworkServiceProtocol) {
        self.presenter = presenter
        self.fileCache = fileCache
        self.networkService = networkService
//        fileCache.removeAllFriends()
    }
    
    func firstLoadConfigure() {
        presenter.updateViewControllerData(data: fileCache.fetchAllFriends())
        updateData()
    }
    
    func tellPresenterAboutErrorWhileFetchingTheData() {
        presenter.sendErrorNotification(date: fileCache.fetchFriendsDate())
    }
    
    func tellPresenterTheDataWasUpdated() {
        presenter.updateViewControllerData(data: fileCache.fetchAllFriends())
    }
    
    func updateData() {
        self.networkService.getData(request: .friends) { [weak self] result in
            switch result {
            case .success(let friends):
                guard let friends = friends as? FriendsDataModel else {
                    print("Not FriendsDataModel")
                    return
                }
                self?.fileCache.addFriends(friends: friends.response.items)
                self?.tellPresenterTheDataWasUpdated()
            case .failure:
                self?.tellPresenterAboutErrorWhileFetchingTheData()
            }
        }
    }
}
