//
//  FileCasheMock.swift
//  vk_appTests
//
//  Created by Dmitry An on 16/12/2023.
//

import Foundation

@testable import vk_app

final class FileCacheMock: FileCacheProtocol {
    
    var dummySavedFriends: [FriendsDataModel.Response.Friend] = []
    
    let sampleFriend1 = FriendsDataModel.Response.Friend(
        id: 100,
        firstName: "Vasilii",
        lastName: "Poupkine",
        photo: "https://vk.ru/photo1.jpg",
        photoHQ: "https://vk.ru/photo2.jpg",
        online: 1
    )
    
    let sampleFriend2 = FriendsDataModel.Response.Friend(
        id: 101,
        firstName: "John",
        lastName: "Doe",
        photo: "https://vk.ru/photo100.jpg",
        photoHQ: "https://vk.ru/photo200.jpg",
        online: 1
    )
    
    func fetchAllFriends() -> [FriendsDataModel.Response.Friend] {
        return [sampleFriend1,sampleFriend2]
    }
    
    func fetchAllGroups() -> [GroupsDataModel.Response.Group] {
        return []
    }
    
    func addFriends(friends: [FriendsDataModel.Response.Friend]) {
        dummySavedFriends = friends
    }
    
    func addGroups(groups: [GroupsDataModel.Response.Group]) {}
    
    func fetchFriendsDate() -> String {
        return "2023"
    }
    
    func fetchGroupsDate() -> String {
        return "lorem ipsum"
    }
    
    func removeAllFriends() {
        
    }
}
