//
//  NetworkRequest.swift
//  not_storyboard
//
//  Created by Dmitry An on 26/11/2023.
//

import Foundation

struct NetworkRequest {

    let urlTemplate: String
    let dataType: Decodable.Type
    
    func generateUrl(token: String, userID: String) -> URL? {
        let urlString = urlTemplate
            .replacingOccurrences(of: "{token}", with: token)
            .replacingOccurrences(of: "{userid}", with: userID)
        return URL(string: urlString)
    }
}



