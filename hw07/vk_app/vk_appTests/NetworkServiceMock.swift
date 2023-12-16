//
//  NetworkServiceSpy.swift
//  vk_appTests
//
//  Created by Dmitry An on 16/12/2023.
//

import Foundation

@testable import vk_app

class NetworkServiceMock: NetworkServiceProtocol {
    
    var completion: ((Result<Decodable, Error>) -> Void)?
    
    var success = false
    
    private(set) var wasGetDataCalled = false
    
    let result = FriendsDataModel(response: FriendsDataModel.Response(items: [
        FriendsDataModel.Response.Friend(
            id: 100,
            firstName: "Vasilii",
            lastName: "Poupkine",
            photo: "https://vk.ru/photo1.jpg",
            photoHQ: "https://vk.ru/photo2.jpg",
            online: 1
        ),
        FriendsDataModel.Response.Friend(
            id: 101,
            firstName: "John",
            lastName: "Doe",
            photo: "https://vk.ru/photo100.jpg",
            photoHQ: "https://vk.ru/photo200.jpg",
            online: 1
        )
    ]))

    enum NetworkError: Error {
        case dataError
    }

    
    func getData(request: RequestType, completion: @escaping (Result<Decodable, Error>) -> Void) {
        wasGetDataCalled = true
        
        if success {
            completion(.success(result))
        } else {
            completion(.failure(NetworkError.dataError))
        }
    }
}
