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
            let firstName: String?
            let lastName: String?
            let photo: String?
            let online: Int
            
            enum CodingKeys: String, CodingKey {
                case firstName = "first_name"
                case lastName = "last_name"
                case photo = "photo_50"
                case online
            }
        }
    }
    
}
