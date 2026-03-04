//
//  NetworkHelper.swift
//  TraningSwiftUI
//
//  Created by Sigfri on 3/3/26.
//

import Foundation
import Alamofire

class NetworkHelper {
    // "https://api.escuelajs.co/api/v1/products"
    public func postAPI(
        url: String,
        params: [String: Any],
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        AF.request(
            url,
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default
        )
        .validate()
        .responseData { responseData in
            switch responseData.result {
            case .success(let value):
                completion(.success(value))

            case .failure(let error):
                debugPrint("AF ERROR")
                debugPrint(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }

    public func getAPI(
        url: String,
        params: [String: Any],
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        AF.request(
            url,
            method: .get,
            parameters: nil,
            encoding: JSONEncoding.default
        )
        .validate()
        .responseData { responseData in
            switch responseData.result {
            case .success(let value):
                completion(.success(value))

            case .failure(let error):
                debugPrint("AF ERROR")
                debugPrint(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
}
