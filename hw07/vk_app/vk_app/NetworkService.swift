//
//  NetworkService.swift
//  not_storyboard
//
//  Created by Dmitry An on 25/11/2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getData(request: RequestType, completion: @escaping (Result<Decodable, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    private let session = URLSession.shared
    
    static var token = ""
    static var userID = ""
        
    enum NetworkError: Error {
        case dataError
    }
    
    func getData(request: RequestType, completion: @escaping (Result<Decodable, Error>) -> Void) {
        
        let request = RequestSelector.returnNetworkRequest(request: request)
        
        guard let url = request.generateUrl(token: NetworkService.token, userID: NetworkService.userID) as URL? else {
            print("Error while generating URL")
            return
        }
    
        session.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(NetworkError.dataError))
                return
            }
            if let error = error {
                completion(.failure(error))
            }
        
            do {
                let result = try JSONDecoder().decode(request.dataType, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
