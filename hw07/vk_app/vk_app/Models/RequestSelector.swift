//
//  Requests.swift
//  vk_app
//
//  Created by Dmitry An on 14/12/2023.
//

import Foundation

protocol RequestSelectorProtocol {
    static func returnNetworkRequest(request: RequestType) -> NetworkRequestModel
}

final class RequestSelector {
    
    static var friendsRequest = NetworkRequestModel(
        urlTemplate: "https://api.vk.com/method/friends.get?fields=nickname,photo_100,photo_200_orig,online&access_token={token}&v=5.199",
        dataType: FriendsDataModel.self
    )
    
    static var groupsRequest = NetworkRequestModel(
        urlTemplate: "https://api.vk.com/method/groups.get?extended=1&access_token={token}&v=5.199",
        dataType: GroupsDataModel.self
    )
    
    static var photosRequest = NetworkRequestModel(
        urlTemplate: "https://api.vk.com/method/photos.getAll?owner_id={userid}&access_token={token}&v=5.199",
        dataType: PhotosDataModel.self
    )
    
    static var userRequest = NetworkRequestModel(
        urlTemplate: "https://api.vk.com/method/users.get?fields=photo_200&owner_id={userid}&access_token={token}&v=5.199",
        dataType: UserDataModel.self
    )
    
    static func returnNetworkRequest(request: RequestType) -> NetworkRequestModel {
        switch request {
        case .friends: return RequestSelector.friendsRequest
        case .groups: return RequestSelector.groupsRequest
        case .photos: return RequestSelector.photosRequest
        case .user: return RequestSelector.userRequest
        }
    }
}
