//
//  FriendsModel.swift
//  not_storyboard
//
//  Created by Dmitry An on 25/11/2023.
//

import Foundation

struct FriendsDataModel: Decodable {
    let response: Response
    
    struct Response: Decodable {
        let items: [Friend]
        
        struct Friend: Decodable {
            let id: Int
            let firstName: String?
            let lastName: String?
            let photo: String?
            let photoHQ: String?
            let online: Int
            
            enum CodingKeys: String, CodingKey {
                case firstName = "first_name"
                case lastName = "last_name"
                case photo = "photo_100"
                case photoHQ = "photo_200_orig"
                case online, id
            }
        }
    }
}

extension FriendsDataModel.Response.Friend: CustomStringConvertible {
    var description: String {
        return "Friend(id: \(id), firstName: \(firstName ?? "nil"), lastName: \(lastName ?? "nil"), photo: \(photo ?? "nil"), photoHQ: \(photoHQ ?? "nil"), online: \(online))"
    }
}

extension FriendsDataModel.Response.Friend: Equatable {
    static func == (lhs: FriendsDataModel.Response.Friend, rhs: FriendsDataModel.Response.Friend) -> Bool {
        return lhs.id == rhs.id &&
               lhs.firstName == rhs.firstName &&
               lhs.lastName == rhs.lastName &&
               lhs.photo == rhs.photo &&
               lhs.photoHQ == rhs.photoHQ &&
               lhs.online == rhs.online
    }
}

