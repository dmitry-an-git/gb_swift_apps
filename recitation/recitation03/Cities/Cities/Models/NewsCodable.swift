//
//  NewsCodable.swift
//  Cities
//
//  Created by Dmitry An on 25/11/2023.
//

import Foundation

struct NewsCodable: Decodable {
    
    let results: [News]
    
    struct News: Decodable {
        var title: String?
        var date: Int?
        var body: String?
        
        enum CodingKeys: String, CodingKey {
            case title
            case date
            case body = "body_text"
        }
    }
    
   
}
