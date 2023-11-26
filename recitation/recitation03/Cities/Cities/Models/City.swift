//
//  City.swift
//  Cities
//
//  Created by Dmitry An on 25/11/2023.
//

import Foundation

struct City: Decodable {
    let name: String
    let coords: Coordinates
    let timezone: String
    let currency: String
    
    struct Coordinates: Decodable {
        let lat: Double
        let lon: Double
    }
}


