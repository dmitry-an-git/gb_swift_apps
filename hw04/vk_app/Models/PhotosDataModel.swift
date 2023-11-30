//
//  PhotoModel.swift
//  not_storyboard
//
//  Created by Dmitry An on 26/11/2023.
//

import Foundation

struct PhotosDataModel: Decodable {
    let response: Response
    
    struct Response: Decodable {
        let items: [Photo]
        
        struct Photo: Decodable {
            let sizes: [Size]
            
            struct Size: Decodable {
                let url: String?
                
            }
        }
    }
}


