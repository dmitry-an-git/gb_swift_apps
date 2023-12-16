//
//  CoreDataClass.swift
//  vk_app
//
//  Created by Dmitry An on 04/12/2023.
//

import Foundation
import CoreData

protocol FileCacheProtocol {
    // MARK: I'm not sure if I should include all of the functions here or only those that can be called from the outside
    func fetchAllFriends() -> [FriendsDataModel.Response.Friend]
    func fetchAllGroups() -> [GroupsDataModel.Response.Group]
    func addFriends(friends: [FriendsDataModel.Response.Friend])
    func addGroups(groups: [GroupsDataModel.Response.Group])
    func fetchFriendsDate() -> String
    func fetchGroupsDate() -> String
    func removeAllFriends() 
}

class FileCache: FileCacheProtocol {
    
    private var userDefaults = UserDefaults.standard
    
    lazy var context = {
        let container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                print(error)
            }
        }
        return container.viewContext
    }()
    
    func removeAllFriends() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "FriendCoreModel")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
                try context.execute(deleteRequest)
                try context.save()
        } catch {
                print("There was an error")
        }
    }
    
    func fetchAllFriends() -> [FriendsDataModel.Response.Friend] {
        do {
            let friends = try context.fetch(FriendCoreModel.fetchRequest())
            var newFriends = [FriendsDataModel.Response.Friend]()
            for friend in friends {
                let newFriend = FriendsDataModel.Response.Friend(
                    id: Int(friend.id),
                    firstName: friend.firstName,
                    lastName: friend.lastName,
                    photo: friend.photo,
                    photoHQ: friend.photoHQ,
                    online: Int(friend.online)
                )
                newFriends.append(newFriend)
            }
            return newFriends
        } catch {
            return []
        }
    }
    
    func fetchAllGroups() -> [GroupsDataModel.Response.Group] {
        do {
            let groups = try context.fetch(GroupCoreModel.fetchRequest())
            var newGroups = [GroupsDataModel.Response.Group]()
            for group in groups {
                let newGroup = GroupsDataModel.Response.Group(
                    name: group.name,
                    photo: group.photo,
                    screenName: group.screenName,
                    id: group.id
                )
                newGroups.append(newGroup)
            }
            return newGroups
        } catch {
            return []
        }
    }
    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
    
    func createFriend(dataPoint: FriendsDataModel.Response.Friend) {
        let friend = FriendCoreModel(context: context)
        print("start")
        friend.id = Int32(dataPoint.id)
        friend.firstName = dataPoint.firstName
        friend.lastName = dataPoint.lastName
        friend.photoHQ = dataPoint.photoHQ
        friend.online = Int32(dataPoint.online)
        friend.photo = dataPoint.photo
        print("finish")
        save()
    }
    
    func createGroup(dataPoint: GroupsDataModel.Response.Group) {
        let group = GroupCoreModel(context: context)
        group.id = dataPoint.id
        group.name = dataPoint.name
        group.photo = dataPoint.photo
        group.screenName = dataPoint.screenName
        save()
    }
    
    func deleteFriend(friend: FriendCoreModel) {
        context.delete(friend)
        save()
    }
    
    func addFriends(friends: [FriendsDataModel.Response.Friend]) {
        let fetchRequest = FriendCoreModel.fetchRequest()
        for friend in friends {
            fetchRequest.predicate = NSPredicate(format: "id = %@", argumentArray: [friend.id])
            let results = try? context.fetch(fetchRequest)
            guard results?.first == nil else {
                continue
            }
            createFriend(dataPoint: friend)
        }
        setFriendsDate()
        print("core friends updated")
    }
    
    func addGroups(groups: [GroupsDataModel.Response.Group]) {
        let fetchRequest = GroupCoreModel.fetchRequest()
        for group in groups {
            fetchRequest.predicate = NSPredicate(format: "id = %@", argumentArray: [group.id])
            let results = try? context.fetch(fetchRequest)
            guard results?.first == nil else {
                continue
            }
            createGroup(dataPoint: group)
        }
        setGroupsDate()
        print("core groups updated")
    }
        
    func setFriendsDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let stringDate = dateFormatter.string(from: Date())
        userDefaults.set(stringDate, forKey: "FriendDataDownloadDate")
    }
    
    func fetchFriendsDate() -> String {
        if let stringDate = UserDefaults.standard.string(forKey: "FriendDataDownloadDate") {
            return stringDate
        }
        return "not available"
    }
    
    func setGroupsDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let stringDate = dateFormatter.string(from: Date())
        print(stringDate)
        userDefaults.set(stringDate, forKey: "GroupsDataDownloadDate")
    }
    
    func fetchGroupsDate() -> String {
        if let stringDate = UserDefaults.standard.string(forKey: "GroupsDataDownloadDate") {
            return stringDate
        }
        return "not available"
    }
    
}
