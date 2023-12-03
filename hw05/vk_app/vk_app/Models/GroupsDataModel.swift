//
//  GroupModel.swift
//  not_storyboard
//
//  Created by Dmitry An on 25/11/2023.
//

import Foundation

struct GroupsDataModel: Decodable {
    let response: Response
    
    struct Response: Decodable {
        let items: [Group]
        
        struct Group: Decodable {
            let name: String?
            let photo: String?
            let screenName: String?
            
            enum CodingKeys: String, CodingKey {
                case name
                case photo = "photo_50"
                case screenName = "screen_name"
            }
        }
    }
}
