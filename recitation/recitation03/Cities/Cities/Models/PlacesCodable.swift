//
//  PlacesCodable.swift
//  Cities
//
//  Created by Dmitry An on 25/11/2023.
//

import Foundation

struct PlacesCodable: Decodable {
    
    let results: [Place]
    
    struct Place: Decodable {
        let title: String
    }
}
